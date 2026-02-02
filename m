Return-Path: <linux-arm-msm+bounces-91551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBJJE5r4gGmxDQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 20:18:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A75ABD074C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 20:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37E763023360
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 19:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1A82F2918;
	Mon,  2 Feb 2026 19:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1ciN4v+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bw1cIl+n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF2A2F25F4
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 19:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770059894; cv=none; b=I55SY5FOKTRp9w/73digDHLVo8pspcQYz4k28os5D7Ubz7uXAY0FYWxs5J3w58nFvymGUw/vcwuwDmolSpCDg8yZ/11KCPvTrIOC2yv+pvInImTTz88OMEhwMHEWjjJUo9I+7Qc31WXIgWIa6p7VoMeog+3LejsWK7fvYvZ/LQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770059894; c=relaxed/simple;
	bh=VuJF53bRbEZuM/ViXJScRf30HwZPpFcIx5Agw9X+HFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUCXyCUELYabJ8z0NtzboCcE0pv4mepFpPfavexHSdkftOf1XIt5RJFnavJ5Uj0QjVx+22WVDpggOFwq4bZCoDU6qzS7/W1vpxg2qrZ1vsmVuxXjVRyf9s7CwUTrKad9xXYdPIkr9Iv3YZG1cdEIVCwLwHeKMW3AN0reDz0Vr7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b1ciN4v+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bw1cIl+n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612BART53082919
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 19:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7Ge72n3jVcYwkIxd3WGK3mGj
	T+x+2KivVhNLFPkYiP0=; b=b1ciN4v+Nm/zh0pNhN/kKBDlSHsM1OewbKvNzUnU
	gLWTifrN090lmGdMIuGsnLAqBCsee6yjXPQrzhTVc/ogL5P5W3fKYphRRnpiHOxv
	xd8WcoA+5b2fyHAtkSd0OK9NwHcOLhISO1sLSkd/0FBWVJu/bwQMPYPa57KsW1b7
	f1gVvZVkiP7CP/lT/B8JLIoHhpSNNop8+m9V2Qs1W8Eff8HuJMnIG3rZlqte2R6e
	H3T3GVBxXJYa8QiZxeZAmRgjCdUeb/ijlUtKFPkyOwJROBO57gGuWFlid2keFavJ
	fR2pjaPoTzrTYP5XAr4u7MRHLsMtk3LMZ028K4Z3o+2b/A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2ttn1hss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 19:18:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52c921886so566001485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 11:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770059891; x=1770664691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ge72n3jVcYwkIxd3WGK3mGjT+x+2KivVhNLFPkYiP0=;
        b=bw1cIl+npadqZD9iUjRXUWxWK9J2I7pZAdyK2jOmDViVQr3pZIesJSTIszrqVuiTDR
         bal5uEOO9UwUvpLXR/kLPuo771hs/vBFzBJIKy1PaJShr9/1Fn8eVuVjte3bufH0he5l
         AXuGf7FQ+r9K5OAVgmCyUbDJNQtm83fkQs+HKqfzbAXWgsKFt8Fh3PBWEj6c/CTpbteQ
         s1Tz2AHW2hpFoCdPsC80Cqfn9R8ScRDUoeaTtDF052U1uW4DNrH9sejB6+r3AMrVeypC
         WxdcOR4aHTwUGRGlnZvrH1Gq1KplDHSatL+f+ct9PDsGeqLgR9m5flO8QbIFUp2laebg
         bD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770059891; x=1770664691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Ge72n3jVcYwkIxd3WGK3mGjT+x+2KivVhNLFPkYiP0=;
        b=C4bBRBcSIaWTjXYBg++wdwHj45+UpaFcN7g6MCOAwI9v+eZvnfYqgMg1iJVj1GLVpL
         Ki4swOt/69gtNc5JFHZ0Vhk1EcaZvTYxPH7fHZrJSuJHuM8ex2D3z4+ZrtnvT9avcRPj
         aJb7xUukpn03//ptJzH/taIr7003t67ydUzc5TyeXwQT8K+orrUvAFARTeFsf7Qw5XC7
         6ZPVH5l3Y1AjQr59o4b+dxxKCOcRoxD7DuGF7Fgj4/+aee8+bOY5BRljeWBO67CdDcGv
         zV8bFya3HReVKuAIwAIBO/RMhsSg3XweTOF80dU+vRiZ3FDD2dkyUWefDbjbhkAtC/z4
         mUDg==
X-Forwarded-Encrypted: i=1; AJvYcCXkOvNYrtt/+fu1+ScUJKlxEf9/FGM2RJ8r7K2FRwNn1iQhAXDWWEDDO6ZBcQTdKJ2Pb+d+pxAz90Zp3d8d@vger.kernel.org
X-Gm-Message-State: AOJu0YwNmCL7zh0guhncYeiICGcOoog0gfondSSLu6/wbPLRGL8P/nGk
	YM1LR/aF99RBgYrzXaHjBq5heyBqvtVl9sGeNdSTx3q4RdFVeymoLPfNIY8SZZ6X5yAlJmcxoYr
	yuLckGBXJf87IMfKUhj5j58cPBplp4AZfZIA+JZXqwO1oWAm/wmOwZqArm+hS6BNFQ3C2
X-Gm-Gg: AZuq6aKxa3/n7QUag1cOs3mybKwbEDrK5BKuBxne52tM5DoWsqNOGEH3xSWxnk4Xs9a
	M+1Sk9qF6gVKOQHI2PcnZI63JKRfZt9IbmLZT5P85HthwHwaS9oh9fW0XjVdm1H5/pF/DbAmLKl
	fldSLbR24QBg/KCNc841ln0skytcv4tPC5Pg3LfYaPNPP0dMOC7nrX7zr+zIzFJhjol+Hanu0WX
	DH+UppQ9XxRursAUFtS5ae69uFPDt+FfyUF1M6o7iKyo8LMfoz2V4jLFlcf+d1OZCGwwaZkPTuD
	NXQB8w+1d+iXLkfFilWvWtznMh+sUAdIHsF+IVDoPitTY8dx7tio44uJZIZfpliIgRENaTxaj22
	nG9ATgmLLOweY4HvPo4aOR+0ZAz7ifHmV+RZEFnVWuMMbuXWX6gmgqZb0VGP8qeC2maauU1gE2n
	DDoCeYdde5YgaQn6eg2ZH3ScQ=
X-Received: by 2002:a05:620a:f02:b0:8a2:e1db:f442 with SMTP id af79cd13be357-8c9eb275ca3mr1583578785a.30.1770059891441;
        Mon, 02 Feb 2026 11:18:11 -0800 (PST)
X-Received: by 2002:a05:620a:f02:b0:8a2:e1db:f442 with SMTP id af79cd13be357-8c9eb275ca3mr1583574685a.30.1770059890800;
        Mon, 02 Feb 2026 11:18:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625f6c2d0sm32239421fa.23.2026.02.02.11.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:18:10 -0800 (PST)
Date: Mon, 2 Feb 2026 21:18:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, quic_vdadhani@quicinc.com,
        quic_msavaliy@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Fix UART10 pinconf
Message-ID: <rxe6yq5xe6ynpjzwqm4yx556qq3j7dogk5bkkuujkz4ijuqkgn@gubukdsdenni>
References: <20260202155611.1568-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202155611.1568-1-loic.poulain@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ANnNY0ku c=1 sm=1 tr=0 ts=6980f874 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=F2uzNt_Jvis__oCUEkcA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE1MSBTYWx0ZWRfX4+Z0ktwe8AEO
 vQ2jqHcogEmkCcgUkiSgz1SxWq0UXa3ioLwEeZx1R0IYSjjLOSb01vYUnE8FPyeTD7/IanKwSwb
 t4fDggNl4W88OkiJlXJRe8M7w0QNds8BHFadbsdrlI2bD6HW53E26GzeqK6F6m8o6hr7kYXcdS5
 injLhiAzUVLO201PRuWEnUUiBHkb4cOaPuCVvl8VcsDGSlBWubwtigPQolSlj+nkQopPOEnuU63
 tX30Ew9uDP02gj91ADIrfEwVyBdwMr64Mq8OrNUF+TFIpnYfTZx2qhVbibi1hcOuy2aQaicMA6C
 DkYQEo0CXHTYQQ8qyCzCOECtE3IhluHY6JkSUtCBVbQxjl85dEd+lkwJNjTWa2kCPUPU5KSK1je
 mjxRsUKw+Txy++sD9xXcCIsURa7EbVw6dGmzVvDf4FrB72uwSMzYkynQqY4slToG+qUDyK/t86B
 7K9E4yHYWmOW6tevG3Q==
X-Proofpoint-GUID: mRUhCTuI-rWck9NauANFCElO9OEBaE5T
X-Proofpoint-ORIG-GUID: mRUhCTuI-rWck9NauANFCElO9OEBaE5T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020151
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91551-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A75ABD074C
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 04:56:11PM +0100, Loic Poulain wrote:
> UART10 RTS and TX pins were incorrectly mapped to gpio84 and gpio85.
> Correct them to gpio85 (RTS) and gpio86 (TX) to match the hardware
> I/O mapping.
> 
> Fixes: 467284a3097f ("arm64: dts: qcom: qcs8300: Add QUPv3 configuration")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

