Return-Path: <linux-arm-msm+bounces-101717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMP+IFcV0GmV3AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 21:30:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBC3397A64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 21:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8DF9303A4A6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 19:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9AA1CEAA3;
	Fri,  3 Apr 2026 19:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzIkdM4x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="heP7M17f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ED236607D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 19:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244620; cv=none; b=YOLpw3FD75Aj5Nzj+PvjONnWzV7Uuv0w2CqteqaZ4mS4E9n9CJqW+KH1gJQ/MXYJR3XJ11uygaPp0DhmkfgztvDAiA+hi4oH+iAhhrH1S2wbnz9A8dXqt2cZ+137BsPTRFwVItGP1fAQVwrUK9whNiecgS5nNW+hzDRSY58d/Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244620; c=relaxed/simple;
	bh=5nbHgkZ8sU9but8KPZCsdUP48/vis75RxWzu+7Hq7ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3/8QnVggO0O0yubZsRol21n0gt2kchmROyVLAf5Gz5yFnHrAnjoFtusR7rjqF23WiIl9V+6Y5ZL9cxpQ/8wI8XNhE6j5vF8vZnlGbUG5oBLoUp/rlrtBoMalI2E9pHqtdOSSJpxoSHTPYk19oQtGif+u4qdykPhpmUpzj4ut1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TzIkdM4x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=heP7M17f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633FbLqi3449997
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 19:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VsyulyJEd9fkuORDKRPPQ4Qo
	N9xTMT3iEK0TAJuE1+M=; b=TzIkdM4x1vxQxFaWhQ5g/fzZ3ffutyeUtsQtQe0u
	6QpN8gf5dwvbLwkJApk9Q0CukSmYdGiRw4vNtnOBS+7VxrySpF2JgOJd1iKP9dUd
	U0YHF/SI/3YYtBjt0rUCuh6TtgALvQUEBQMZnobZARItCTCY1oL5iTCz+UYJZjyK
	Q4qCdA9ONrC5HM2dTV4PmYrReNXQ9bzLdXjZqfgEoLquKsuIA7iKUfwCQpmJxy5C
	51SoPr3VOHcf0aPlI6W4TYmw30g+Xla16zl31qzo/f1n83APbDCPNIptlDGWTJU9
	c3HwRa8lhIAQL7HUGC3y+8xoursrsXY7PIxC1E7quLVc/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da8u5a1ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 19:30:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093025ffecso38856811cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 12:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775244618; x=1775849418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VsyulyJEd9fkuORDKRPPQ4QoN9xTMT3iEK0TAJuE1+M=;
        b=heP7M17fW3elKC/WVttZPn4f0uihexcgeWyNVQKg5Yfv8f50UJRHTqsiplDY7y+sp2
         CIAG1KdPRzcHQqUT9OlBjDBntQPZVAiQYafMfZ9uGL5I0OzCFbBwiatrqnAUvrVBiqPT
         wa34KVdLr0TSJiHfuEmTsxGaCuu8ltzyeF+s2XAbV0jD2kabn7Z4SefvEBQ8kx5mfzoL
         Hd1BvuyFQLHew6z0VeDK/7/vWsIZf9oNSi8EqM/8dLRXZB3rStKysiUQZ6D6ARukAMC+
         nkBFitH4KZgJrS0bC/3G8R3qropV0/Kg/UsscNpQjYUQfHPtrJHgwo47bixxNPUVMmKz
         YJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775244618; x=1775849418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsyulyJEd9fkuORDKRPPQ4QoN9xTMT3iEK0TAJuE1+M=;
        b=d2J392fn4OJau75r0wr4ITmM+t3dmeq9Flg1xaeqVj423CQhXQvaMD77vjEvj/jacb
         SvDwkQkm5i9USFzQLzFIoZfQ+OqS4Y80/kDfPCNnHe7iN/PWVbt5rPiAIwByNuG6gB9T
         YBBvoCnN2Vgij/dbBj6KfTJi8fG0tCKZI7minYuaEEMRBy7LwEGGWFEZjozYmj3FNj/E
         JJwy+QNU+1V/RB+uRgR8vAr9m84M1sYDgIhaJD4plCDL53nikiUaTjxQz6JzyX9IZhYO
         jKsSJ+YLqj4k0UW3N8IS/5dOoORju3C1E2j3Cx5lf15ueop92zT8qfrzVgvUDczMlU0F
         yOKg==
X-Forwarded-Encrypted: i=1; AJvYcCVOWPfQedEOgst8ulQOh2OAtFsd3NwCNdnvzo+c0vnti2YyeP6LC9bPxShqgodOJuzIF8VRm/45qmt4/QA8@vger.kernel.org
X-Gm-Message-State: AOJu0YyADu9Sk5DOKu0RqMcsZg0vsH4UcEUuoAhgqPpNFSCgc8BxhoJy
	29UaW07EGTBh6f1qxc1Y7q/dpiNvb86Gz26T8Yxuy2EiFqYzQVvi5KBTwKSdiaUto7jrk3GJmUs
	jvgciU4XbqbT31xsBYaqw3JmsewQGipichbILPwAEez32PzIm3aJFKieEIFmG/2n5ziga
X-Gm-Gg: ATEYQzzGZoJ+a0rJx1MMTdWvZzIp2Oh5dFualVnkpGt25URx8W8bPhoCYkXM5H+QnEG
	NBbHSD820Oo5Z0FmY1MLH7co6v2xzrMZRoOO8/goliVDvUJhCb4r1j5DlgEjYQuUwlSys/lnoDj
	CMJih4j2qt8+SVYCLKUbOFp3mdJPlJ07+mxlJI/2xMcO1qv2ZeNnFEdE9Lb2esPQUrH1EgBBLyO
	JGNk3i+l8wDnO3Di/q8oiMoE7E14ssTynopqhU667ckjaobVuj4KPUGxqxXlz+7sGD2fptrxPK5
	Rak01I1kjPwys/uBRcTZlZD6Yo7nRbEbntrv2jyepbkWnnf2AvaTO8HxDGlCRNYpUWvLHN7QO+O
	2chIcQxqeIyi+dxWvix77+0BKagk1GTkvzy+jVR68ORJv5LwXoUFPOhT3J2g8/00xsn0xnCpM4v
	BEPKx+s+/QlL0YoRX+9zCMYm2XI+8611vto8s=
X-Received: by 2002:ac8:7e89:0:b0:50b:41b7:d6c2 with SMTP id d75a77b69052e-50d62ad8295mr64091021cf.47.1775244617873;
        Fri, 03 Apr 2026 12:30:17 -0700 (PDT)
X-Received: by 2002:ac8:7e89:0:b0:50b:41b7:d6c2 with SMTP id d75a77b69052e-50d62ad8295mr64090421cf.47.1775244617352;
        Fri, 03 Apr 2026 12:30:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fa8a93sm13810691fa.7.2026.04.03.12.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:30:15 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:30:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add IMEM node
Message-ID: <2xztppp64gvmde4zvj6eevjdowdioojawcnbqe4s4izwgsjixm@kkluxswbo2nh>
References: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
 <20260403-milos-imem-v1-2-4244ebb47017@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-imem-v1-2-4244ebb47017@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3MyBTYWx0ZWRfX67qryznqSvcQ
 p03knBF8yV+IAUf2D3nFCtl1b5+eh+Dpv/Xn2+1GEL8cMlzdlWcSC1K8teBD7YjzOHPV3W7aynX
 izJqn6emf1JpWG32qGID3QKCmPrelI56citm9htAy5q3/ESFIFopEul6ggVGkndAsxRE/n4XoIN
 7Xom5oyiX1OWb3E5WQl4w7RpCIBwfH+pH65RreQ/eelWakz4DH41IkQ20KpWOlPyVRLQl6va5qO
 RL9hmkyS/VSUfJggyqlY+E3J+v351pm6op/7ObAl2RuC+/gCZXrFAWRsp2bc2EbeeiF4rQ/4jKs
 dNZ9sWrNyqzxJWupThF+aIS+8GgYC3rxVarE+wMjor2kKRA0y5E7X2ZEWbIaTYlDT8EVq4od6i4
 jIySYeJIeujzgmqdxlHL4qzLUHJ9W6r6ZUPrhLfNN1IqgHGho2Tj77S3Xx/vEp6Wy6sEUOA81Zz
 X6UmyfH3cFNgkKuhESA==
X-Authority-Analysis: v=2.4 cv=W5g1lBWk c=1 sm=1 tr=0 ts=69d0154a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=6H0WHjuAAAAA:8
 a=Lmd6kY3naWo9R1DdeU8A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: VdDeseqX1LhmqOkdJMOEPumvvWfpW2cL
X-Proofpoint-GUID: VdDeseqX1LhmqOkdJMOEPumvvWfpW2cL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030173
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101717-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,0.0.11.184:email,94c:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.223.255.192:email,0.228.225.192:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CCBC3397A64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 05:00:24PM +0200, Luca Weiss wrote:
> Add a node for the IMEM found on Milos, which contains pil-reloc-info
> and the modem tables for IPA, among others.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index 4a64a98a434b..1c045743ef77 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -2289,6 +2289,25 @@ scl-pins {
>  			};
>  		};
>  
> +		sram@14680000 {
> +			compatible = "qcom,milos-imem", "syscon", "simple-mfd";

I think, the latest trend is to describe IMEM as a mmio-sram.

> +			reg = <0x0 0x14680000 0x0 0x2c000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			ranges = <0 0 0x14680000 0x2c000>;
> +
> +			pil-reloc@94c {
> +				compatible = "qcom,pil-reloc-info";
> +				reg = <0x94c 0xc8>;
> +			};
> +
> +			ipa_modem_tables: modem-tables@3000 {
> +				reg = <0x3000 0x2000>;
> +			};
> +		};
> +
>  		apps_smmu: iommu@15000000 {
>  			compatible = "qcom,milos-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>  			reg = <0x0 0x15000000 0x0 0x100000>;
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

