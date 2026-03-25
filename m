Return-Path: <linux-arm-msm+bounces-99832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AtIIjLDw2kVuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:12:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5706323B0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 746413155862
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546B52F1FEC;
	Wed, 25 Mar 2026 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nq//joma";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hhQs+m2Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073BC19343E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436695; cv=none; b=roChQA+dKcSEiaHBJU6YXjOFKRQGKq7qagUygP6D8Orc3qpsg6btaSvFtEDsoMKKLAQmV6g3hbnxt49yVHa5q+4JenGYY+c9gEDN67q9Y9Vdn1SO4YEql5qlVaDbzXMCG7gmmnp6flOV6cfd8Wg1bMB3n2grYbCe143Whry9WK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436695; c=relaxed/simple;
	bh=UiQfDSkXFnK+USypmoJ0iuMw3MTgsXcYxDNg1yOKe7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M5wITutjy3FH9pQttIHTY19Yz5R3zduNrQrlLIsDiSNuGi/tFq8uIDCDAOoqebx2vWoVBNEx5LrF6QnighyyipPivly+Cx8zft3aUtCZ87QkOu2c1j1Yk6CKWmwHJAV9ge/ct59pYfAmr4NljZyDbaDQPSvJm+u5whLqB0OVIeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nq//joma; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hhQs+m2Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PAFATr1208507
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8G6G4aosQtrA9tx+ufEAxzAUa9Gs2oXeFM26jYouehQ=; b=nq//jomaRWRwzRHr
	Nw/8mxCTAfdnJ5xRnavfYTNVqwh5RNGwdNGE1zXtycLO8DY0kkOVSAsupxue0hxD
	bVreJfnIZ2eEey4WS2QAisFIae2x7weRRtdztlqvZ4fRKT8HPbIlkfkGPqQzxE6M
	vqpciQPm4lpSMezpE+7vOovVgAMPqBlhZU5inYi9pfNIV6wqdhldo9yBp1R4vptF
	XfbmqlNLHXxaNfU5rF9Iq3dCWn4jXAd6aLvMC2dtWOqldNYQJ9tlW5Tk2dV6lB5a
	cnxycMnXxvPRJ8vWAH85r/AErhrBLz/YF58uTYbAdCzFVAL4sughCt7wOsYDk858
	HLmVTA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d48599g3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:04:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c646e980bso1192969b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436692; x=1775041492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8G6G4aosQtrA9tx+ufEAxzAUa9Gs2oXeFM26jYouehQ=;
        b=hhQs+m2QpxicIYSOuG9IUrKfpc9nOWDLRaqYRUvV1EfYupaBMaqrZuYHQ6T8m9vx78
         qVdMcx97Ir1LvC9QGIBsTOeaug2muSg0u30vSe8BPsq96u7U/Cc1eazQ0D9eZkUiIZEg
         ISBLEfYyhvgra09A0roTxL7O1gOA3ZkWuxO7NvLxpEKPaKDxFo9jRIxAJpEcplRxjEmv
         0IK25B52CK6vpzUJSTr5YGwh/Cm4P3wOMUznh6isFDCsDaUok2GCoI8n6CBqjQLoxV/7
         XH4LMuTcnPJpz7XPkilnKC4QEZTPFSxJrUe3z2WIBMU1apriZ5NWd6ImWiJ10qZMFcHc
         fTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436692; x=1775041492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8G6G4aosQtrA9tx+ufEAxzAUa9Gs2oXeFM26jYouehQ=;
        b=HYFM5QR9EA2GENxzu9DVkZUG5HKWT8T3EeeGJTPqgbgmWL4NvEK8mvvGfhgcDyXbAX
         jS71aIAMAd3bUZCRNvZpsfX2jYs1SII8SJ46lmH6WlDytqpTQ84CqhDX4mhp3ICQ0MI3
         jrIfV/2qTFTJXL31rGU520kWEd2DcGERyE5MyJEQvA5Muhmn38zYpTASuw4UYyGuanIR
         7cIdHxafh4O/s0HssmXhT5rD/0Jh+XvxoiuhbRTp29/skhdUO2sqWYMRanClfkeW6Kpz
         59pMQT3sfXIPoZ1NoO+3ktcpZMd0ubZkcX69IOaVcbfr9N09OXLlTMcf7tSh6UyChot0
         8aqg==
X-Forwarded-Encrypted: i=1; AJvYcCXtQinDMRdCwDYZWJN9ZAuv0qPRqJVzIsP22lr2KLRtt/6YeTEZ/cUkAuUaFXrHIp4PAnUiC4O+buTov33u@vger.kernel.org
X-Gm-Message-State: AOJu0YxhzVwj/CKGnbKoelouc6ZaNGXp3uxL2l0XjCfgh0+Uc5GHcHAr
	tI4OE4pO6zzwbFLjw91xtRt/5Y98qCqIBocxjqZXHhoKavo0dstndSuyEcpaa1OYEgiZraIYpSz
	V7Fd/NtUTdVLtPWWcauPl2wDZwH6IKt+Hz8DRav7pFCz/nbCKZhDR9sRqolCE18NViGMI
X-Gm-Gg: ATEYQzzHiBqC8UgrNZlRp30pJP07d21/viMdDyrDNUCU+pyo3xtGd8FfSHV7gwAWVmh
	mXxO/WSSKmngx6IZR5C87WPCQBe1dyrrArsuHL8WduFXMKPtT4fTOcMz2zSp4cT4keQbPEQrb86
	Qc6KRMTF89uFlqz5K84UZu+5MnshDjCgK/HOmJEbd9ru7Ml2PUV0lWH9UQ2wlfCcajaQBrBCf4Y
	ZtHVu3Yp5qq0efGT3pu5tfQ56jHtbX6nL6MtgAH4bAY5yzeq3FYkiweEC37UFEHWafOuoxuAPSy
	0I6wBIyGqBjmynnZeOlkEV4PbP0ozXoLVY1SSkWjttyU/mmkveSaTQSn0eSzlL6hIAltuEFG/3D
	0jxzaU/DjYJtTKTZ/1ebSHXeGHqEY6/QP3e1kLdILYJ3ud9e3oo87ZA==
X-Received: by 2002:a05:6a00:9089:b0:829:9cf1:642a with SMTP id d2e1a72fcca58-82c6e0ea945mr2890088b3a.47.1774436691965;
        Wed, 25 Mar 2026 04:04:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:9089:b0:829:9cf1:642a with SMTP id d2e1a72fcca58-82c6e0ea945mr2890048b3a.47.1774436691346;
        Wed, 25 Mar 2026 04:04:51 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7ab97c1fsm100790b3a.60.2026.03.25.04.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:04:51 -0700 (PDT)
Message-ID: <eb02b13b-50d8-4fe1-ae5a-7378ca14726b@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 16:34:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: qcom: kaanapali: Add PMIC devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-1-70bc40ea4428@oss.qualcomm.com>
 <3u6yfqqcxrmf52dl6xxvnrg4jtmwekpm6n5t4p4ujead3urxqg@dognueejo7hk>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <3u6yfqqcxrmf52dl6xxvnrg4jtmwekpm6n5t4p4ujead3urxqg@dognueejo7hk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OCBTYWx0ZWRfX2LDNDvlaziJG
 cSLrpsddhqa9fJFdtj1MCj8TGQEDJWpoLyxIjGkMIUJluYL9J423xuIMEtAVWs5peST+gx3gmvO
 XX3dA6rGN+Gs4S+lDcyxv8oHZJd4JI2haotOGrQY03n6Y71Q6AtMKpsDEGWgQw4sZRBHOnl7YRf
 erKNtBoc571JjTVK9pQgbPK9ZS6hIvHioosLZbOhnkhlLizK6FFJ4wDuVAT0HGPbDzvrkm5Ivhj
 GDgslM3JLCDJiqx9ygLwUVGbKzqPKMniHY95hFn7Z8csFnGq9+br8Wb6triJKhyTasIPbMDu02N
 96xR+FJkx8HGyGrImqw1E0Vp22EHDXO0jlqoGzQrkpMxw8lrV0IrDow8RT6cq7nUpTHnvw2xhdI
 JjDEPFnctNH1Cd0lV9pRPD0SapH8YLPfC8liwSoqBAmWi80U/EPI6Mb84t4krNLPN5GtrRoZ96s
 3QuXVB12sYSYdx5BpNw==
X-Authority-Analysis: v=2.4 cv=VODQXtPX c=1 sm=1 tr=0 ts=69c3c154 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4yz47Ds6lqWh_D6oclIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: EGx5rRZcLQ7THmdCO_yIQ8yrnDcMO6ot
X-Proofpoint-ORIG-GUID: EGx5rRZcLQ7THmdCO_yIQ8yrnDcMO6ot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250078
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-99832-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E5706323B0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

On 3/24/2026 6:42 AM, Dmitry Baryshkov wrote:
> On Sun, Mar 22, 2026 at 11:19:41PM -0700, Jingyi Wang wrote:
>> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>
>> Add a spmi-pmic-arb device for the SPMI PMIC arbiter found on Kaanapali.
>> It has two subnodes corresponding to the SPMI0 bus controller and the
>> SPMI1 bus controller.
>>
>> Also add dtsi files for PMH0104, PMH0110, PMD8028, PMIH0108, PMR735D
>> and PM8010 along with temp-alarm and GPIO nodes under them, which are
>> needed on Kaanapali.
> 
> "Also" usually points out that these should be two separate commits.
> 

I thought it was slightly better to add new PMIC dtsi files in the same
patch adding the PMIC arbiter (which they are dependent on) in the main
SoC dtsi file, like in here:
https://lore.kernel.org/all/20260219-upstream_v3_glymur_introduction-v8-3-8ce4e489ebb6@oss.qualcomm.com/.

It looks like this patch has been applied in linux-next now. We can
add the new PMIC dtsi files in a separate patch going forward if
that looks better.

Thanks,
Jishnu

>>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi          |  47 +++++
>>  arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi   |  93 ++++++++++
>>  arch/arm64/boot/dts/qcom/pmd8028-kaanapali.dtsi  |  62 +++++++
>>  arch/arm64/boot/dts/qcom/pmh0104-kaanapali.dtsi  |  63 +++++++
>>  arch/arm64/boot/dts/qcom/pmh0110-kaanapali.dtsi  | 213 +++++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi |  68 ++++++++
>>  arch/arm64/boot/dts/qcom/pmr735d-kaanapali.dtsi  |  63 +++++++
>>  7 files changed, 609 insertions(+)
>>
> 


