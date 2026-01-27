Return-Path: <linux-arm-msm+bounces-90757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kL7UMWOqeGl9rwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:06:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 745F89403A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 883C23020EC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C433101BB;
	Tue, 27 Jan 2026 12:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SFCOd1M4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EiRfrtl5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9FA348895
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515584; cv=none; b=GJ5gBQZU+jQJe9R0/mwMXnY+2ThlWE6nQ4rshyYVzS2knY6XslyU3/xWW8kLfFCNbPBXLO7Sbn3OcclaJIPepI1rZwHh0lvg9yThWZZetQSSeDn05xshcDIjd6KhRcytGDjAIydMvFLn5sK2rZYsn+lUvuxuCw5Si0nnoCIRyV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515584; c=relaxed/simple;
	bh=HcPqe8fhDNEKoQCDbQZQovvUA+6ZWNZxYiaDEP1JdGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MrsYM/bswQqCEI/19QwUAY/BBND02gUc4TmE9CW4SywghaVQiEJ8hZgMDP4gwdBkSwUq2Ywr4HNNxrGC4TXt6ZDaDUBLJzYoTF2Wab/wifgz6pFia8lTNJ5/djfLOwrS2qbzPETkWVu1UTDbe7iZyP8AAdO41upyrGFsXcifWig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SFCOd1M4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EiRfrtl5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R7S7J3113343
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oJmDDECkW3iXsL3g4I3qEOxh
	a59jVBDs+hiTdIwu23k=; b=SFCOd1M44pt3IzqJIWZy8H8I/QoiF7NXN0rgT0ia
	B19mlTG+dl4OUrVUz+NXmZkqvKzSH2Fy3/oQD+kZqHrZnwT/VkWrDinTkbzmE9N4
	YN/6CH3qZXc7sLY6wDnxZMMpwUbpoQOXpE0OJJ0mQIgoYkVavb9Ro6QrJhqTa8/f
	BtArQZVv9m3PyvBX9f7eu7HNoyjTIkDkjvxpexz8b61aHAmo2eufC1MIrq9/1mDB
	+fR1BvhXvb/Q2Q6Sa1IKodpPpKIjNik88CcAuBXTSBkKa+zINxdheG7EgkxMWIGo
	Yvlttka2K2gQdZXxgdXi/wn6Lf75pJ+xV3BjyoVHuJNj4Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxs0e109b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:06:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-352e1a8603bso5769934a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 04:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769515579; x=1770120379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oJmDDECkW3iXsL3g4I3qEOxha59jVBDs+hiTdIwu23k=;
        b=EiRfrtl5Ml6gcLACJdshtgLW1MLG8jQ1apBosL3LgX6RF/aP2dbqh1khyxktz8Gmfa
         M0qXTUYl5JPoO4iOrQ+owa++e+YLm9OVmBgqMWXmxI8CouH7bE1PYgExcek0WCGWNNJ2
         VWUULeyB9eRQKJ8kD70yNIVen6XFdB/h1fssjshAOfGp1vjne4bkQc2he+//hl2oRJsm
         xOKHaQi2AMkdEpcMiZTSzZDpBYuMH6xoNlJGYN2nIi0vmtxibeyDAvY0EgYc/mmeIPOT
         ea43QmXFLpFcC4BhSp1W4j0RNgOPP1SJoZmmesK1E1psJaJJHDES/bjzlVX+T1UeG509
         IZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769515579; x=1770120379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJmDDECkW3iXsL3g4I3qEOxha59jVBDs+hiTdIwu23k=;
        b=n8+wmozI1BDlAMGU3QIYpaUeVljMCGXiUJXQ5ZSSTZ2bgm978Zv4Y279fL/ANcS+7u
         Fv3hEb2b7hN/eo3BFw+BiQLlg3GyqlMt/omCqAAzqAAoqaCd3KwYJ7AOf0MZ62bvU894
         W7H9dQ1JVHh+3N/oPKsO69nhZduNwZkVzl2OyZxWjlShZlMK7Lp2bcxvbJ4hFmQsRDh/
         zg49+gr9CQqW88uBshpZTcgPCj2+PruFHoOz+92Gk0IC+y61YyrbDqT7zEDXzZ0IDFPA
         f8AUIeWQIRFjD3p9B/aOWL85rysVgHa5fD+qJ2i9ro6z4G6xEf6mF85Ceeoylj3hSlvZ
         +61w==
X-Forwarded-Encrypted: i=1; AJvYcCWquXXwYyg65UKviUhUeUBAEovPnO9/IqH4dylixFRxnEeBpp8O/fVeQIYTgSjjN7rIiG/S4msqMjXcLXoh@vger.kernel.org
X-Gm-Message-State: AOJu0YwVoERsMEpT/zwb5fjz6+vE6aecK0UuFhnPpCEU0j9gdVN2rHpg
	9ahSXNk2C7pege6YEVrvZm63QwC015rYnndKu88BDaaA5ol368g+gad4qCHICbhkoTdOpt/6I9K
	4hRM75/+kUFNi81RfmqTrvcoyFviXiCb5O6Ao9/HEluS4/e34Jpaz3nU6Ifg7EOtojJgU
X-Gm-Gg: AZuq6aKth8hQdFweRT9a+Iee+gxxPKWrdJtgErmfPRTYxtCy/2vv+SdQogolef+DMzY
	CN14GpmPvp7B2xavntDftFefcRNhf2Vjc6dNhYMsN592lhWkht21lPOo+cvUwwfrEq6bVWtb1MG
	1jhh143jRFO48rSpGRGtXj0JjTpEGszORR1xHvfdzMp1A0t8mXuYws72Fap2XrgQ0b3huxBFnT3
	isKaHMuCBSrW21j0FIfg+zBsIRs8AVJ9iVcAbWszJrjwcODO5GkmPT8//tIVdvwvZdlj+tOaig2
	c+pnfC1xlbgWCR3sjNBSp8RKMKhZ4wQxKFiJcB2yH4WubKc1dnUT3EuUWccRAC+syx0kaKtWW2v
	/jmmseiCoHlahXp7VH1uzV64=
X-Received: by 2002:a17:90b:2dc9:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-353fecc66admr1463655a91.3.1769515578706;
        Tue, 27 Jan 2026 04:06:18 -0800 (PST)
X-Received: by 2002:a17:90b:2dc9:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-353fecc66admr1463627a91.3.1769515578192;
        Tue, 27 Jan 2026 04:06:18 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f61292bdsm2411832a91.6.2026.01.27.04.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 04:06:17 -0800 (PST)
Date: Tue, 27 Jan 2026 17:36:11 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 01/14] net: stmmac: qcom-ethqos: remove
 mac_base
Message-ID: <aXiqM+rYK/QCy6DW@oss.qualcomm.com>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <E1vjDr1-00000005fQ3-2rcn@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vjDr1-00000005fQ3-2rcn@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5OCBTYWx0ZWRfXzjsKU+wZRKAd
 NSAinVZ7Y44qzAfwOr7YAXgu3THnWNRy85rBrgkHUonG9IFODYALwHBGCRe+QGyPpEVv7OKA1qj
 9lnkqlJhBzuoVXQQQzX5jHVqvrkgUXeYNlWjx7J3zq31DotjJ60/c1hzDpJjbRyNDy06sZXghyh
 uD2Gfh8BioDdNEvKeP+drZavPv9iM8BZfrwUhulDoBCMVFP4SIc+5VUXglc/xHMuTWn41Xbxgfl
 l6O+jf1avDTQrVOK2fCBHk7frWdzBJcbh/Kd/Sye7Ztsfe1LIJkQjUBEpvPohkrwnEOCgASliis
 JjRR5ASNaTxuTsEmSvuzs8jODJoscD4HNH7JrpxUZLbmjFK5OTpgDqulbfHVinKgRCgKPJNeHdB
 3sH4j7V52JxD1umibZWj+UQ6wjDHiaXYKhlf1yYzPztQAPW3bRdCZmtW7aBVbDp8rFW+1+rHGF3
 wCIxtShDiiLz8dcH8FA==
X-Proofpoint-ORIG-GUID: -re1lgYexG2jwEx-7qyU8BfRyE-UfnN4
X-Authority-Analysis: v=2.4 cv=Hvh72kTS c=1 sm=1 tr=0 ts=6978aa3b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8
 a=2f8CEio2oMm2juszzV8A:9 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: -re1lgYexG2jwEx-7qyU8BfRyE-UfnN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,foss.st.com,davemloft.net,google.com,kernel.org,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,bootlin.com,linaro.org,redhat.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:email,armlinux.org.uk:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-90757-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[armlinux.org.uk:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 745F89403A
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 09:53:23AM +0000, Russell King (Oracle) wrote:
> In commit 9b443e58a896 ("net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
> modification"), ethqos->mac_base is only written, never read. Let's
> remove it.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 0826a7bd32ff..869f924f3cde 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -100,7 +100,6 @@ struct ethqos_emac_driver_data {
>  struct qcom_ethqos {
>  	struct platform_device *pdev;
>  	void __iomem *rgmii_base;
> -	void __iomem *mac_base;
>  	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
>  
>  	unsigned int link_clk_rate;
> @@ -772,8 +771,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
>  				     "Failed to map rgmii resource\n");
>  
> -	ethqos->mac_base = stmmac_res.addr;
> -
>  	data = of_device_get_match_data(dev);
>  	ethqos->por = data->por;
>  	ethqos->num_por = data->num_por;
> -- 
> 2.47.3
> 

Validated this patch on the QCS9100 Ride R3 board, so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

