Return-Path: <linux-arm-msm+bounces-93398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN7YFHYTl2n7uAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:43:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E68C15F31A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 170B330659F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 13:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF232EB87E;
	Thu, 19 Feb 2026 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nxwe/HkV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C8O4m6Kg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800AA33A711
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 13:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771508495; cv=none; b=XOQZe5I3Hv3+B3mibE78+4/aG2dl0vA5jRTRrezXMriDiF5ZQWWW5jygR1IX0375Dxx/8NGzJWlkL2jJkYw4Kdz+2E06xdWqBycS+vbm6NZKFjFBtqYjwGP+Xs8bZUhL8zMzj0V5gyo14UtV86Arc0tUOBaEp8hOkIblirMKp0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771508495; c=relaxed/simple;
	bh=20Z9fVIBU441x42uSsz1Sj4JxiWfvuxBO7Ia8gjZMlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sj41c8Fjb2HK0BC+Jl0dmFm1rkAfLyZ/YvP62a0OPRCI6BjOeBX10AAZW1FBxySRr7E74bTbaZk8/PF7aLY2OtR/NOg0i+i8aUNY4TOvR36Puish8Hy/Ftz/9OTUL6OZX2FjIy+L2r2h453N0nr4a/xk845R+XprVMYeFXfUX+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nxwe/HkV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C8O4m6Kg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J56kfB3319689
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 13:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uAxiuSK9wSFkTqs3VETHbhurI5jwGphbTIwXjonuh1M=; b=nxwe/HkVFAKTVwyO
	tkdCsg/uT7cvo3jMOpIN0xcNJblJnJ8KIZzAIZD5LUn46pXrhKiEdJScFBlOgLM+
	4kdDXyjv8rC+pXyVGtUaM3yiYkje+jOhbbjEc5d/0YJsRwoeMpDR30my3E0YXgsP
	+aS95MCjbYrrlDaW4AV/iFPn8FPto1vWCpLAgqvyuD6XpjBq5ZqCFENw3XMrLLId
	xaLTDHZoUWWz+rkogWTFpEk4ROV4EBYMtgtFlZsioH5gZAvCEOXLc5QBsiPhuaDg
	xctqD4CYvttErYtVmIqe4DxUo6yj8Xcs4f8ecS6iZzjnXr8bzFSLZMUS0U+ZZU3v
	urqIBA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdv3899nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 13:41:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb50dfd542so79751485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 05:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771508493; x=1772113293; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uAxiuSK9wSFkTqs3VETHbhurI5jwGphbTIwXjonuh1M=;
        b=C8O4m6KgVFRDgXCu+dLtilXwwMuqcEnvn40WZallxV7coualAVxw3lpxy7v+xAAjp7
         ZqosyPYUEuRcUjiovavjPQjmfQxO19pWgROc2VYznPFdAPzo/fs2RT2yAxe5KNhPSa/h
         +tr2ZevK0k6z+aR/rShJYpUYZXyHdKfPA2UIbTmbXQ058//yIG6nZRoh4FHQ+2ssU1ju
         epIRyRNPLSSqqNVqJwLDkuuqoICOTazjYG88iuMWkuVLuTR9rvau50aKjpBMsP6sR+sy
         2LVd80dyo4aMSpjCV7jqO+R3w+rdO9kGjBSHH+SnbPaMd6Xchsxnrm/ZMmQWO96jDIsC
         6RUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771508493; x=1772113293;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAxiuSK9wSFkTqs3VETHbhurI5jwGphbTIwXjonuh1M=;
        b=jZ1rApAQYhHCD0ByfBOwYAGMLs+eVqCC1La13YUOwrpUZtuA9Li5SfbwqqbT592KKU
         PDvMaUmTKGwZTD06UsaqqnBlfzHOvVgzDh6SAuv9CDbR1DhHDCFdieyNgVPdyj1z8z2k
         diFiwTFye6sj2GtFGM9HliwhgDTz7UPh0w8z39BCL4rRajDirrX5Yyw0hhsFmUSPR+lR
         EBZHolR9SS2NuDitN+0hyAmvhBtpuNd3U5f2OVMmvA4m4KYUGCpa72Dt12gHtPM7AVyr
         0YaegwbswLdLdTAUQW5hXfWF5fpMB1dxc+kwF9XHMySzPtKQIhK5JtI/dvSwoGJ+wYMj
         fcqA==
X-Gm-Message-State: AOJu0YwBb3Rrmzt2eiRaiLnqid440ij7TEUo4INFavyr346a7/xhDxiZ
	N/gKpvvgLDA/Sf1bxAkOFeb5nZtAk7tXdpxkXknR1fewi7SeZWOstn0eYYR+1LZfq3G8RHGpk+F
	e3r/f0NawocYPwvBzM62ADjlaDO6bZhaySgJ8pMiVopt6YrVsZwSMUAKOUakHvbBQsWXx
X-Gm-Gg: AZuq6aJJ2f0oRYLq6szZTivPBQRno7s1oZLYChRkQcKsqwTnpF2nnl6kPjBnNXQo/wd
	Bzpc7e7xl7K8uqfgoh4wBBs5vDaMDwMzGfMS6ph7QJni9vU3AYMuXr1W6BqX3cbyyT5vesCgcIR
	mCk0g+YuPlNgdzYwQ9ko0xZx8iCO0z02X78JfLbzU/sNUeS72PFH8nPvVwqtmVFIW2owuz/I1Zf
	oHqZjFKQ9W5z0QWNy4q/IlB5i13OQwZePasWmcneYXL8sXAmOWSTqvLJDjmNCvjkw58S255Lb/c
	ZeU+KLom8a9H+vWjMSf4BKg+c0GwAEfcxjgZYDJPahXX941zNItVpKdKt2jnWb3O+SuTJM+7ozx
	8G1qhQ/WpERqmLfw7hMvPbe0iV1C1I7ImYfDn5VQtzNtLtUDuxGWFCeeCyp/OA+hxHfNoGzvun3
	ZXvl8=
X-Received: by 2002:a05:620a:7006:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cb408e956dmr2073442785a.9.1771508492677;
        Thu, 19 Feb 2026 05:41:32 -0800 (PST)
X-Received: by 2002:a05:620a:7006:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cb408e956dmr2073439385a.9.1771508492167;
        Thu, 19 Feb 2026 05:41:32 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3f0d09sm3973329a12.25.2026.02.19.05.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 05:41:31 -0800 (PST)
Message-ID: <98730ff5-05b7-4275-be1d-1f9506adeac7@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 14:41:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Enable mdss1 display Port
To: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com
References: <20260219-enable-edp2-3-lemans-evk-mezzanine-v1-1-969316806538@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260219-enable-edp2-3-lemans-evk-mezzanine-v1-1-969316806538@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ceffb3DM c=1 sm=1 tr=0 ts=6997130d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Ef-4Cf4N8LchGzUAi7gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Akzes8PPU60rPnNfTop5AGt6n8XmrWtO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEyNSBTYWx0ZWRfX75iQgMsM0RcF
 pxGSQA9Q8TJO7IUF3g1khcRrYzjnBi5MW2VOtu0c5lH3mKh2QW9MrVfdxO+IWDevagOuwCnrdOU
 XWvMt7a2o6N6/H1D04K5hIm7knizb3ShMaYhLNnzvUn7ip+rBE8lrF3NfXhHmzbU1Ld3n+oGSvE
 57OjQIb8MpQfV56j96RRUk14nZ+Jxz7hoFCTGIvoN5/kVVUJm+5K0KD8m27oOtm12KZEAGSdzTg
 3DbjCllySpryQurhtS2qFuWmR/R7TCoC0hObvhmBGlB80gHfoRDt9bBkGtGQmfCO2XyHFpitNSj
 6IxJDMTr1yAGbGJaRzVVnuV+vu4km0Z3zZs8sXq2RzTj9OvR5aHUwa0hbKJFJdxxAwBspjaiR0F
 BsrH1q2mmg9yWY/aGwNrg866+/KZ9EAr1xlIEc3cOaHHSt7qy2yoeknqMcDnezPuQtGGNx9dmKV
 vskUgpQUysPiUG2w95A==
X-Proofpoint-ORIG-GUID: Akzes8PPU60rPnNfTop5AGt6n8XmrWtO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190125
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93398-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E68C15F31A
X-Rspamd-Action: no action

On 2/19/26 2:36 PM, Gopi Botlagunta wrote:
> This change enables DP controllers, DPTX0 and DPTX1 alongside
> their corresponding PHYs of mdss1 which corresponds to edp2
> and edp3.
> 
> Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
> ---

[...]

> +&mdss1_dp0 {
> +	pinctrl-0 = <&dp2_hot_plug_det>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&mdss1_dp1 {
> +	pinctrl-0 = <&dp3_hot_plug_det>;
> +	pinctrl-names = "default";
> +	status = "okay";

Nit: a \n before 'status' is customary and it's present in all other
nodes in this file

[...]

> ---
> base-commit: 1a0829927afbfe654c632eb2e779fa32df825b06
> change-id: 20260219-enable-edp2-3-lemans-evk-mezzanine-1bef9932ee6d
> prerequisite-message-id: 20260203193848.123307-2-umang.chheda@oss.qualcomm.com
> prerequisite-patch-id: baf07fce333b86c35c3d4cefbba5800a519952a3
> prerequisite-message-id: 20260217071420.2240380-1-mkuntuma@qti.qualcomm.com
> prerequisite-patch-id: 74a76fd6a1129cdbbd32d91d2a119d693dba78a7
> prerequisite-patch-id: f4a858f7e707c8e330daf2ea1f4da58b4da00f05

This is really long and scattered across multiple people, effectively
making it a chaos for tracking. Could you please coordinate with Mani
who submitted the changes for the SoC as well as the ride board to
send these patches together?

Konrad

