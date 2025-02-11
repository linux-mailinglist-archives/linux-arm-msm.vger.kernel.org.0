Return-Path: <linux-arm-msm+bounces-47594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFBAA30D5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 245C2188917B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3BA244E96;
	Tue, 11 Feb 2025 13:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="0dqaU3dH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DDE24BCFD;
	Tue, 11 Feb 2025 13:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282127; cv=none; b=G4R3fX31Io4B6iR1GTXE0zHPpWnR7nDfTVE7IgoOX40a89ng4PpuFY4+KgpdHfMLYTw/BxSkIBFL4BwZiL/VnUeP13OsRCSuWeaUjUSffLWVRXr/H+4CHSSv1oZosHjih1rEmUZJHbHeg3K5FGocrexG0oZ4u5CArhG3rrXUL08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282127; c=relaxed/simple;
	bh=LPJIW9CtLWEsBpR7hKRNe4DFO7x2P5md0lGDfeCVAx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6y2CSa/ucSn2iP8E8U3VqhBLyqU1IITWOyNG752XCn4Z39+LO+uPGqLhih/YV99y+6ugtMup+m34OlXlUa1vu/AhgzgLZ8liuxV+4n249OM8RA9KH1brvTjcr6ZkUQ9NhT7FJJU/vaL0xlR5buiCtl8WMGkEPkA3obcYRkcZdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=0dqaU3dH; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=JMokV+6fg2Xdrbbos7AcaNWCczEBKC1U9U+IkW3qWZ8=; b=0dqaU3dHW0dUK2VSIVWYfzO/z/
	fgSoO8k7bxswv4vk3Xjd1yaSqnJf+OGhDknkqpJyhJdRbv37Ukd2zRPGwikasLE4viaqihVYfIHry
	tgkfrkKUYeI3WDQoneGWGsNuI2pwHSQYvGWZOUQUgRE9OsmOQzKE9On2Ma55ctJJctHM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1thqjM-00D4jP-Q4; Tue, 11 Feb 2025 14:55:16 +0100
Date: Tue, 11 Feb 2025 14:55:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lei Wei <quic_leiwei@quicinc.com>,
	Suruchi Agarwal <quic_suruchia@quicinc.com>,
	Pavithra R <quic_pavir@quicinc.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
	srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
	john@phrozen.org
Subject: Re: [PATCH net-next v3 13/14] net: ethernet: qualcomm: Add PPE
 debugfs support for PPE counters
Message-ID: <5a53333b-e94c-4fb7-b23d-e1d38d2dad8e@lunn.ch>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-13-453ea18d3271@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-qcom_ipq_ppe-v3-13-453ea18d3271@quicinc.com>

> +#define PRINT_COUNTER_PREFIX(desc, cnt_type)		\
> +	seq_printf(seq, "%-16s %16s", desc, cnt_type)
> +
> +#define PRINT_CPU_CODE_COUNTER(cnt, code)		\
> +	seq_printf(seq, "%10u(cpucode:%d)", cnt, code)
> +
> +#define PRINT_DROP_CODE_COUNTER(cnt, port, code)	\
> +	seq_printf(seq, "%10u(port=%d),dropcode:%d", cnt, port, code)
> +
> +#define PRINT_SINGLE_COUNTER(tag, cnt, str, index)			\
> +do {									\
> +	if (!((tag) % 4))							\
> +		seq_printf(seq, "\n%-16s %16s", "", "");		\
> +	seq_printf(seq, "%10u(%s=%04d)", cnt, str, index);		\
> +} while (0)
> +
> +#define PRINT_TWO_COUNTERS(tag, cnt0, cnt1, str, index)			\
> +do {									\
> +	if (!((tag) % 4))							\
> +		seq_printf(seq, "\n%-16s %16s", "", "");		\
> +	seq_printf(seq, "%10u/%u(%s=%04d)", cnt0, cnt1, str, index);	\
> +} while (0)

I don't think these make the code any more readable. Just inline it.

> +/* The number of packets dropped because of no buffer available, no PPE
> + * buffer assigned to these packets.
> + */
> +static void ppe_port_rx_drop_counter_get(struct ppe_device *ppe_dev,
> +					 struct seq_file *seq)
> +{
> +	u32 reg, drop_cnt = 0;
> +	int ret, i, tag = 0;
> +
> +	PRINT_COUNTER_PREFIX("PRX_DROP_CNT", "SILENT_DROP:");
> +	for (i = 0; i < PPE_DROP_CNT_TBL_ENTRIES; i++) {
> +		reg = PPE_DROP_CNT_TBL_ADDR + i * PPE_DROP_CNT_TBL_INC;
> +		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_1WORD,
> +				      &drop_cnt, NULL);
> +		if (ret) {
> +			seq_printf(seq, "ERROR %d\n", ret);
> +			return;
> +		}

This is an error getting the value from the hardware? You should not
put that into the debugfs itself, you want the read() call to return
it.

> +/* Display the various packet counters of PPE. */
> +static int ppe_packet_counter_show(struct seq_file *seq, void *v)
> +{
> +	struct ppe_device *ppe_dev = seq->private;
> +
> +	ppe_port_rx_drop_counter_get(ppe_dev, seq);
> +	ppe_port_rx_bm_drop_counter_get(ppe_dev, seq);
> +	ppe_port_rx_bm_port_counter_get(ppe_dev, seq);
> +	ppe_parse_pkt_counter_get(ppe_dev, seq);
> +	ppe_port_rx_counter_get(ppe_dev, seq);
> +	ppe_vp_rx_counter_get(ppe_dev, seq);
> +	ppe_pre_l2_counter_get(ppe_dev, seq);
> +	ppe_vlan_counter_get(ppe_dev, seq);
> +	ppe_cpu_code_counter_get(ppe_dev, seq);
> +	ppe_eg_vsi_counter_get(ppe_dev, seq);
> +	ppe_vp_tx_counter_get(ppe_dev, seq);
> +	ppe_port_tx_counter_get(ppe_dev, seq);
> +	ppe_queue_tx_counter_get(ppe_dev, seq);

It would be more normal to have one debugfs file per group of
counters.

	Andrew

