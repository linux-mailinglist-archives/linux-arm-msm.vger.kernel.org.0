Return-Path: <linux-arm-msm+bounces-102297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCXCJwIj1mklBQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:42:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E203BA053
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FB4A301015E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D74234C98C;
	Wed,  8 Apr 2026 09:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lH9lmU5u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkTWmy20"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F7E33F370
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641342; cv=none; b=ki3AQZuDqPNNSYQt05njizDHddliy33WcRUB5gUkC48ahLOE+hTP9/SXb94/WWmwSBrtn9+UBz6DM3fjA+utyXD42YGAcY1Y+ssPvz9JBXqVwY+wCgc5ks6OFc5Obqkk5gDCCfxazvd19kNGVZ7yLO4LwoKCLvCWl//Qd9I3fLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641342; c=relaxed/simple;
	bh=7Rda2gMVy1SdQZZRHFToWcIFp5Vg/jxtkzMbB7W5W68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bk0aWV0dpzgw1GHi/UwSqrQnTyuqDFpaJC+T5VBZsFgYwk8cDovhUe0H5d+meq+wKJvfstqva6XJVD4BqH6ZqUf1XyyrqD2oOKJIDnKd46xqGCXPRRqJSsr2u6q/gcLqGevpzMG3e4tD7IEA2CDhJ3QhSC6kugc1YpKCzU31ozs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lH9lmU5u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkTWmy20; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6386IjEk249489
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czCCWuYWN5JTYttKvIqlkZ+7kuUoNFqya/4PflgBR8Y=; b=lH9lmU5uUvMkl8rP
	K3W+qwqaTomktgGpeqeIhiu3fghS4+9R2y67ZcPcjdxyXML2qgPF7ez9++i+xcqo
	fNfFOr4FNp05i5jYn7shIhYzR4iyCjxeYIBFHCJMbHD/kT2IDITGsJsrVr9PjpyF
	dzfE6NyD3eBVoTDnLJx0yyB5AFcD7MxfSV+3zgN4W+sRyMEvMipUIQ5jF7ViUTRi
	veLBCMv/1RPn5Gk4RfoOFKKJwIQSkcqs40GbWyxga0VRLz2+cIdMaXvDFcQv884k
	LMo+eap9sPL72uDbhAisATX13yVY0FCOT9eQ9KxVgp0uyIboCD8ApEVHt81CCf7o
	JsupTQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd8x9advq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:42:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d0095b0d80so112649385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775641338; x=1776246138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=czCCWuYWN5JTYttKvIqlkZ+7kuUoNFqya/4PflgBR8Y=;
        b=NkTWmy20TTupqWY7qgyoLvlDW029FKY9vyw2b4o8n182bF1R80ui55ibO1ZCa8XKvm
         W5yngfJ/beNM7Lek4c5GW/jeQanuavfwystV4XCkrdnoxWu9uvEMz3Jp2cOFt2dMx3tp
         jdMjd3p/XzH/qxJq/XfyLuna2pOvpCIuyFTIfb4ZnonZi0eDHFf9L3rddrVA16/XHZR6
         cstV571szSVE2vsUe26YmmadUExA8nKztMWp7QJZJ1JMAkW4QSHoMBVdByes0oGbILYc
         q4s2jtZkgXoQy7l5HtBhsIrAUG0i5MrvgA78d+U7pzigLDVWe/rMOsiz1fME0KD6S5CN
         7viQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775641338; x=1776246138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czCCWuYWN5JTYttKvIqlkZ+7kuUoNFqya/4PflgBR8Y=;
        b=sWzz/AAMmdGRLVSBFhx85x7LmM2leOnXGfGIOgOk+TGca9wwMVGRUDSTu/nFjzE9OH
         ovHxpvrMyVXysK7z7kCm/RsJjzbactVIm6a6tb3oW1eGL4oQqfN3inf/eRZNeiodPBbj
         fK8yOfA/rs2bkfBgxqTS/s796dUJAZMRj59eG5GthNaeGhN/097AvuQ0SIVyqb85yzAJ
         Va+ACHbh7D4kyx0CASRNOPb7YugWKZzqx+0My5AiVE59x4hPuyoHNLYEchCCHdLFSYZ8
         LnX7yqKEfUrs7xRXsL3ITsOV1AX14zK2yrpMzzw2LeSUE2yHLig9CX+YvBgYfJygVDiO
         /QhQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9zlfS1j01DELFeCMrkRume0jCm6mLX9gsNNtTdCO78MzVU1uyTmdlDC2f6r7xlpmUzV/2yaUIkKssCSWq@vger.kernel.org
X-Gm-Message-State: AOJu0YzEok8VGDSf2zc9Ro0Wi1du+XZ/HVqGyzpVwV0PNypAne9ckait
	dYXZZ1KuuOAkAAEgk1gIjVuOakYZPGVl6RtsVFpnxuvdBVEDT4NMvjwXN+rJe4ODjjFL56orA7y
	dn6cPGDWzm/w0YtgIn/DxdfkKAlnZln1TWfL815uftJjveEXzOp9vT+RkhD7xyUpo+301fkPkvW
	v0
X-Gm-Gg: AeBDietVNocGXRxSWsvqOsTcONRVeHJVAUeyuDR4UW4Ln/g0NFm05VZCUaPbrDZS98N
	5iU++/oytSXmiO8M4o7bOrEqIih/GIwk7UnhXE6bUeywFRGlzqwvi3d1x6bAfpNg/vr3dqivns4
	27Vgn1GsdCXPAxiIzffs5cDb7xvqp4vv+yLg+NKVlR+oLthb42UsjFOYi1XGBTmkloga6YDoRrV
	kKJU9084W7g29zwrZwz2Iu5uX0SQCd4fPwZ1Eaxlx3jrdCFDtTfSwftHuulYPyXAJytRVjr0+JR
	mGwvqoN/38h5qeVwvOvSZL6exrX/lij+EwpKvj7xBQeIlx6b/YT/WZ+211l76W1bUyOaSnP46qR
	bYRwg5Y8VD36YNVJneeDbAS3S9DLsQ2HIkvVySSY5JYw6a3oth60fLkGLb36VDe2PGvAr7r4KTQ
	dKM94=
X-Received: by 2002:ad4:574d:0:b0:8a5:e0a7:d99a with SMTP id 6a1803df08f44-8a703d202c8mr260254966d6.3.1775641337855;
        Wed, 08 Apr 2026 02:42:17 -0700 (PDT)
X-Received: by 2002:ad4:574d:0:b0:8a5:e0a7:d99a with SMTP id 6a1803df08f44-8a703d202c8mr260254796d6.3.1775641337366;
        Wed, 08 Apr 2026 02:42:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d3ba180ffsm6454566b.35.2026.04.08.02.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:42:16 -0700 (PDT)
Message-ID: <f087dfbc-ec6a-44f9-a119-2255f49d4bc4@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:42:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arch: arm64: boot: dts: qcom: add IMEM and PIL
 regions for glymur
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
 <20260327-glymur-imem-v4-2-8fe0f20ad9fd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-glymur-imem-v4-2-8fe0f20ad9fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rr716imK c=1 sm=1 tr=0 ts=69d622fb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=J39E50f51TnHoGT_JMoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NyBTYWx0ZWRfX08HWq61Akxxy
 3a44uVlD7wJGGy+Dqd/T8BTtQm2xXCYjdtpPZnmvSGDFrfDaUNzbx0ZUm29jKVwbiUGB4+js19z
 TzB4tjycMr50n5TCfdGHhRkjLFDSrq6lOhM9hZIQHRwYueaYwF/DfjWlmT4kOnsxE5pS5m1xm1i
 MeuiV9hqDrThZUQAfDi1UdXdsMJwZpVKdyIrPyw4mrQdf/jKvHBHXcqvkg+pkUd1prdoPG/BOVR
 S8OzBqbD4kUnFbv2lTPp1N6DChIswmCaneQMT4fr1GB0PNNBEVThNL0CjJ8z2qRo8vTgUDMYgUR
 NpSJ565/lXTR2NNXjqTjarpDDUPmL9eLZw8ll7jqmSQPl0Hec+PLCvhFchmKygftajZEUL98V1f
 /LhNWbM8/Mf08Bx4R6vgZfsT2gb1Ay2qZAm2HThzFG0FT5nCNaweJcy3u0zOVFDVekflqUopCd5
 zWQ/GPEJAeNFWYhUXuw==
X-Proofpoint-ORIG-GUID: I9s_PcWlpY1uelmyD1a8G653WeWC6RJr
X-Proofpoint-GUID: I9s_PcWlpY1uelmyD1a8G653WeWC6RJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.223.255.192:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102297-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01E203BA053
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 11:24 AM, Ananthu C V wrote:
> Add an IMEM on glymur which falls back to mmio-sram and define the
> PIL relocation info region as its child, for post mortem tools to
> locate the loaded remoteprocs.
> 
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 4886e87ebd49..21ae05f0ee17 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -6457,6 +6457,22 @@ rx-pins {
>  			};
>  		};
>  
> +		sram@14680000 {
> +			compatible = "qcom,glymur-imem", "mmio-sram";
> +			reg = <0x0 0x14680000 0x0 0x1000>;
> +			ranges = <0 0 0x14680000 0x1000>;

size=0x2c_000

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

