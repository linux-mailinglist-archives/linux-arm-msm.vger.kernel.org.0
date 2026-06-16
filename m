Return-Path: <linux-arm-msm+bounces-113301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kaZgM0uYMGpgUwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:26:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A0368AECA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:26:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mMyUv+U8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XmVeOM1U;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113301-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113301-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0ECF7301A7C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD4423EAB2;
	Tue, 16 Jun 2026 00:26:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DECF233935
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:26:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569608; cv=none; b=o403FMhilI/MepD5LxCIKUxIYvGvds6LhCjd+whKPmwBpmKkDpBzxh8dWb84UoIq/orXwV1xVjteFXAsa/3VQwQhJFjqf4iZ9CfYoEXXlvqDJkCTUb8/KyNvJkQVO67HGWpfa5DqCYJnzXyKBF9VWaOhPnCzXfQwuyHVj2uwII4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569608; c=relaxed/simple;
	bh=0TrEdUJRvXuitdwBSWjGtGrN0JNohG3HeK5r141lp2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RM+cWFW4/PUhENB8X4/xOqHCk7LrPLLgNpovW9WtvLCDmeeVX582AAK5W7NwdeHCdDyHazE36IKZuN6pI5FHOoHSwAgzrnObhtrmmboPqHCRmwLs6/UJvWXfKbhFzIgZ/W2Gy9hj9T0inU7iNMqUah0rQITpFYnlyZw8DDEvVfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mMyUv+U8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XmVeOM1U; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0OPRR2064163
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2PULfDpM/oWn3b+RYT5n7mKC
	3htGe0l2sW/Vd8Ndc2M=; b=mMyUv+U8HmIqMyQxa7CCJ5jRFG/pk6aXjOLnYmKU
	FvgETP+v6v9agNp2dyEGkAixrimrf2zcXrvXHsANpgguPafynfNdycyYQ2uziEez
	5MgJnfOa01GACEp68bydD54dso5Do2qGT8BvM5mL/TqSV5aMo4w8H3DV7UUL9xW7
	GqDw7xUemJrbXqRg8gz/zuOl9fPetB8AT6BiaBP6Q6jefikr/vuD/IN06oveef6y
	/g0Ve40r2yIb+g2/fwxdjPM0gFXfV+4SHHnCP/rKogHOYUF+ZHVR+AkwWTcTk+sF
	nULqryoSpoRCYCojbpvW43vEPTZaE1Kl139ii58NPyWLow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteguutnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:26:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915f7bd027eso1042885285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569604; x=1782174404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2PULfDpM/oWn3b+RYT5n7mKC3htGe0l2sW/Vd8Ndc2M=;
        b=XmVeOM1U445ulwE2RZklfaoObhWq2iYZpWAjMdCRq57aCk4Vng4zrdQmC7gIMQpwiE
         /8B6cd+pjWLGOR8more4U4Oh8iO+gK5SB1sVp3/K/hNUNh9Ec/x4jjo3/fZefu2fLCJ3
         rlie9Xpe3S4dbyzYhuLI4Umd5/UkUQCrpxkb1QhomcMy8T8GREkTKdT2wFj/MBwJnN9n
         gDgM6qAtbiOx/xp5qrCOQeKJHG3uWJQ4/Um9pOGfl5DB5IV88TIBz5FY3/v3OLlrx89A
         xZn1EYvI187W8BiZY05nyrbnd9/NqzTZbb0gg4/4umupabEHFHA+O1WhsPXAFOMZTM8N
         dYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569604; x=1782174404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2PULfDpM/oWn3b+RYT5n7mKC3htGe0l2sW/Vd8Ndc2M=;
        b=koFixUFwBRC3ASwQh1AQ5t5bgiwuayHJXtErzK52rTNo94eFj6ev52jF8/7tRJn1Gt
         mWn1SDAq6U3C52WpOgZdBZ/0rYtpgobhhmLNum0j+W9CPTJXZXDXrbqCy+844RAx7/sF
         oWj90Mkj4TVt+4OpxAjgVS7+FTqplPD4HuvARAXWPiRRXSz+wB7dPHWOnK0fhEKCnm06
         CFWAj4LmjVvOVVp5BD/FIwhKtvc0sq6LlJ8riEhlgKAYxCXWh7CR2Nr1ihwDKrM8O95U
         dl9s+CRf7wuVyiDtnC9Y/BFbXmwEcWl2CAe7mnMR6Vd1DXrmV0IcOp92Ej/ZjZCsk5vn
         bV4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+71NOyxDxfrTPrrjx432deQWmf5jSt4uHgdnqaeZxrYALFy4390PpYArZ9/XeEmE/BdEdaCEfb/OXfj+Zk@vger.kernel.org
X-Gm-Message-State: AOJu0YzQyNKD6TmbCD9oq68Km+FzxYaFHGnq7jR8qE5tmHBUm8Ym2ndL
	HbYAfy8LvSY3NR3CQCTVc5vkWvfUVd2TyLSmfnMufMe8S1a2qQLLK9nLQ4DV/hq895yDs3mIGsO
	F9gnxOeTpohsmm5oL3LspsPZlPRTXx7505J7gZp6Dalr/RTGmYstqgrhIlFh62tcHhKZ6
X-Gm-Gg: Acq92OFMzOleTxdQgxI+s8kkT596ATVAXRPn7ZWQCIkVXHPWBhhJhQkRzLCB9Js+YyJ
	YVKTtp6SdvNPSp7jaIwhj950pTf0qdRZhMRDpCZhhTrRwVJCS6SpyQWgFcLY8HQ3AZkvz2yz5ip
	F/w3fHzg4OaEG+YLtJ+YI2fgw9b5KoVXSdcP8hie8YhcoTBSjOL3f1r5r4G3eS/6UNIDMLKaMB6
	Zm69EbU8eEUobKTf6k1YDr5mtaW87cQf2U/c49CbSNRE7Kr0h3sAftZLc7/DRReB1zO0MEtzSZX
	U8w1Q1CT1CqpgdrPnfiHvBvmrGegv+mruU1w53S8gedrsfEjUvuKxPzvMIRjtG6cUDXJVPAgrAm
	VBZbRbM4Y2JABdd7h2CFHJL+mWmA/0GpE6ZQ+EhLMSnZOAyFT/94z4TvZxPinti/wtC7f+jfeqV
	YwhlKPvav/J/vuu/lIAWhldU0wLmAFALBH1Gs=
X-Received: by 2002:a05:620a:3943:b0:915:cf88:1e37 with SMTP id af79cd13be357-917f2a16e72mr2177767085a.47.1781569604532;
        Mon, 15 Jun 2026 17:26:44 -0700 (PDT)
X-Received: by 2002:a05:620a:3943:b0:915:cf88:1e37 with SMTP id af79cd13be357-917f2a16e72mr2177763185a.47.1781569604104;
        Mon, 15 Jun 2026 17:26:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161fd4sm3161734e87.14.2026.06.15.17.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:26:42 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:26:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH 1/2] power: sequencing: pcie-m2: Add PCI ID 0x1103 for
 WCN6855 Bluetooth
Message-ID: <hndyeomouu754rwevoigc2ai4ywtz5lhodizj4amjuyn4azjhq@f6ixgilydtg2>
References: <20260608091702.3797437-1-wei.deng@oss.qualcomm.com>
 <20260608091702.3797437-2-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608091702.3797437-2-wei.deng@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMiBTYWx0ZWRfX6AuH7m2Xfba0
 ZtLsMFgqkQMHK+9k4dxtWjOMNqkZbtfrbSi2LqqmWJNmLZodgbuq9PAQlM5rGKYS/HX/Pwh9YiP
 79N/O9mf4o/0+zYWHkXysKCx6z4/+x2Ksh6vg3p7m0YsfNadhxrXdnv0ebddwTiz5DCIIKyxYiL
 zgL45RXE6MYBXmUhd9/jruPYczYQ25jbnwHXAWl1fT8h5Sg59ar4dzNnR1r7ePJpHG8lH8lKMDi
 YN5bWUrfUwq2yNZiYLN8MPwl5QLD5CISalvPUyviZy7cFERzX5/qNT6B6WIEwmtV48jdqhqaju5
 ZVUZXajOsp8WIEcEylR5IGI3JX2I95YGaaFos3345mo/1mwMqN5JxiPRzWIVrZNo98AtDxHpJpW
 8DlKMD9nLEbEvS3wIqkHJ6pNq2uwMKdGnISdWeSKAZVdbmJCU/W8uPBq595e8A8SxX227UdDZ3A
 8IdJ0AuTovqPLOzUkKQ==
X-Proofpoint-ORIG-GUID: B9AXMFhX0flsaSbz6-1WTY1Xt2FsyQyF
X-Authority-Analysis: v=2.4 cv=HMvz0Itv c=1 sm=1 tr=0 ts=6a309845 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=1WnTIQmyWdCf-KxfHyAA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMiBTYWx0ZWRfX3YUsyZ9E+bJs
 AJyGPgmrFT53WcDlni/iQEKkQfgd2g40QjXDrM8Lgr+A+i51ynl1TCK14ce/A8h+b3WmipCceKN
 DN/E3SQ1m/yv7XJX3HtfzGXC6lk92EQ=
X-Proofpoint-GUID: B9AXMFhX0flsaSbz6-1WTY1Xt2FsyQyF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160002
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113301-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,f6ixgilydtg2:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:wei.deng@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38A0368AECA

On Mon, Jun 08, 2026 at 02:47:01PM +0530, Wei Deng wrote:
> WCN6855 is a Qualcomm Wi-Fi/BT combo chip that uses PCI device ID
> 0x1103. Add it to pwrseq_m2_pci_ids[] alongside the existing 0x1107
> (WCN7850) entry, so that the pwrseq-pcie-m2 driver creates a Bluetooth
> serdev device for WCN6855 cards inserted into PCIe M.2 Key E connectors.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---
>  drivers/power/sequencing/pwrseq-pcie-m2.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
> index efeb25ba9c79..b3af14464314 100644
> --- a/drivers/power/sequencing/pwrseq-pcie-m2.c
> +++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
> @@ -188,6 +188,8 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
>  static const struct pci_device_id pwrseq_m2_pci_ids[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1107),
>  	  .driver_data = (kernel_ulong_t)"qcom,wcn7850-bt" },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1103),
> +	  .driver_data = (kernel_ulong_t)"qcom,wcn6855-bt" },
>  	{ } /* Sentinel */

Please keep the list sorted. I saw that Bartosz has applied the patch.
Would you please send a followup?

>  };
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

