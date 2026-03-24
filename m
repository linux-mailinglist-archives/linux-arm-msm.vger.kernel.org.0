Return-Path: <linux-arm-msm+bounces-99619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNqiCnBswmmncwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:50:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCF3306BB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 485AD304DF07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D14F3E4C7D;
	Tue, 24 Mar 2026 10:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORsAYmbI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eTRBdWHw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1231C37CD2C
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349296; cv=none; b=gX9dkHbSfhAUCoxwwRiZWM55UelyFdWyAV+NbAikZsiLGciMPyBM3lshq6ScndCMcVjUcf0Vd3w2/mndCUcBa2zMSHCHZZWL+1gMQ3yn94arWGjoLdljMg0Xusw1v0ONJkEFc7cmOtEKPXVcHG2y7X/IsraJTlR0vzdzUBlX7fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349296; c=relaxed/simple;
	bh=9jANrywhGynZWMyKf2n6PWYNg/VaHuMRL315X+Xlo3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQNbBzmdil2kRwwF1hnqJig39jD8tMiFroRvznBkitpmmkGvi62BttDCYvY4SAEzgKcuCp8pE9dvGGnqlh+3F5c1m8IszuPBtZQOJf7gLxpFBkW86I1Hmvv4xsYV7lYXvO2nbgZ6lSjAFQ/EOArqt51De+bXgiU5ytraI7pEULs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORsAYmbI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eTRBdWHw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9Poge3934878
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c9FRDksXZJcHie1G3wv2p+BeUJQkrbEedFfbFCXtXWM=; b=ORsAYmbI2YD1uoKq
	sva6GsEUA0I1BErH8DvCmRJhaBkGlZBWR7ctc/cx+OVmFmun+i+D2G74Lvwf8c0k
	APJG8qjHIipGdXj7jHuuKuVW7rLeWPS0T+UiVbAPBwU5MH8oYLxeidh469PEh1QQ
	btMTy6GRPg8W5kB3yIcO7RM5MhyubkiWUVBlohVSXdiwro8Li0f4QZ23pj7fHJOD
	BbnERRAwTExypJsxNTjsFTrqFuEEkBwd2OkgpSbwFyq/Cg6sH94L/vt9V2Vc8GCI
	a/9WSRWHUSCRYl4epM2Qy5pe2i+/Z60rnE6dlBYucww2AydB7DmfuyZGJ6VxDJe5
	OKR6Bg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0m14f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:48:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b06b68783dso25472545ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349294; x=1774954094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c9FRDksXZJcHie1G3wv2p+BeUJQkrbEedFfbFCXtXWM=;
        b=eTRBdWHwoB23asfu6+AJoIAXAd72CK8XnMHuFeN6G0V2QssreW3JmOAn6Hr83KqXZU
         uYlaswOb+0lIYdT6OJ3Frva8uJGDcVXtUpFdQQ6j9tvDMNxqlhN+UVyXPWWNPyDhMpNC
         kLOntOBTUtI6fYzKb9T1O5eFOWSIVyWsO2bRPD1Dpv6afFhrqv6rA5ZR2J9oGYEyLcQI
         mLuMS42FusJIpj9hHdVuqjmZo+WL8rUFankgqzmocw085fri7lMozHHzAX557m3QbjHA
         MOrDV1qS2vSf3xBTDOhdXRZ7vvQcWfl1Od6a+HIXXfvinKuek/4326/qJUGJzYjZv3id
         9stA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349294; x=1774954094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9FRDksXZJcHie1G3wv2p+BeUJQkrbEedFfbFCXtXWM=;
        b=lIMtAw3UCnmnURNrq+jEVyIUUuZe5ThWQwhtO1d0Z9qVeHbsGxMoKZUa4acK7BttFE
         za3C4BKIwWyceAzpfVrI3E1uRENDP/7UepVXz7QVi2W/6sPOIcR59sNFJVvdehO5b3pl
         xh9YgYhkCdI1uRhvUmSujwyi4UWDFoxlzF7fICRDgHGvDZ2Mb5LkFxFpuLkHx+78nlXM
         H6zJynQXIc/lzfHvA2ji26CUDq6Sfqai9bygj36mPYTGSVniPOFTmrbWdiMgScX2c/9K
         PfXi6mlHHzoGCXUDcPpEdWaGynjb3XwX5rt1HukYMxJ6FYJ5+OonMKCewb7ExMoAzDsa
         vD1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGBGnpspsfYlwV34ed54UUQswnFyTPtghqq82w6MfL82MYBPGWAIjKw1t2AzCWbrl32rmd6K3qrbVYurQi@vger.kernel.org
X-Gm-Message-State: AOJu0YyXnUbL2DSd+3M98zBcbZumlehtOYl2ww8XejGUBtXZYTRAfWyv
	GDHjlCkHZHvV5PC9I1hz6NlbWrw8dcX0j7oOdReXYErbTcA/dSh50bhHoideEqW4QNRfXq5xvLf
	ioY1yHhj8j3LOz2HSdvYSGeHLhhYFrDTgUcslnNFC4XMoeitV1kRa9O4H0VXR0DxooqSd
X-Gm-Gg: ATEYQzxpVCy6HrrDKt5fQVjMAu35vZZlXCHLuTagBQhEAthBkH9A5V25qjKcoZPOplN
	DSKm+kYZReGRhzy9N03bbDIZ4S1z9+eDSELknTmu3B4Ae+d9FauCw1CJOPeaRwC8CbXpuCExgEA
	Iq5fl+4VoFJnMTSk4H9zB7rVs2IHy34qK4WgMZCWUedYAcCaFIWLycQUG/sZ4oK1EkiXjnGGJN8
	ILxicuXC+KU57k/FVAWcOjup/Wwi7WvqQym7dl4PnXA3NdGJX2T+GlfpavVtbAedGPyEt2A5Psy
	vcnDhh514Qopzgu9tjz+bwmow5zspQAa1Ez6vxK7rc3btHKcLzN/V5am4N4GSxPVTQiV4hRbc5J
	HDda3/DcHXUaFOfzxYpAJ3sO/XNLqzoVH1ZYtpjf50cGN79o6oQqq
X-Received: by 2002:a17:903:22c6:b0:2ae:5a55:3ded with SMTP id d9443c01a7336-2b0827f767cmr149400835ad.45.1774349293691;
        Tue, 24 Mar 2026 03:48:13 -0700 (PDT)
X-Received: by 2002:a17:903:22c6:b0:2ae:5a55:3ded with SMTP id d9443c01a7336-2b0827f767cmr149400415ad.45.1774349293190;
        Tue, 24 Mar 2026 03:48:13 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083679867sm166698485ad.65.2026.03.24.03.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:48:12 -0700 (PDT)
Message-ID: <63b6b7c0-92ff-45d3-9559-3ec3b3a30a1d@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:18:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/11] arm64: dts: qcom: monaco: Add power-domain and
 iface clk for ice node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-5-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-5-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c26bee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NiBTYWx0ZWRfXyOfI5FgvCOV6
 R4d5S2TFa/AjZcrzylFzkc3zKqY92B9/pH3ar0VjHv1rhNi37DeRdgtF8yO39E+PqXd6qoBK2WF
 w0gU7qN/GdDx9oprydUI6retqlsDGTpfOvQEyPUwNzhHb+C9eNGK9z0dqOybZhikqbshi0t6n6/
 VJZLV7dDUmHMEZoHOWIVyjGfA6wYQQCNLydv1OXUA7bv1SGb9GwDrY7R0KmNehI7NTTu6HftoKn
 Thn/QyBQPThhYqKzWNqSobU3daqq2KnWla72YPvKWT1gNjteNRgHFizjvbZBx9FTqcM+ziQzyo0
 ZO92v+gb1Z3savJobds0iTzzglRL5uOUeThzyxzvxJRMnPlGKPVkLAs1xSxKIHcVBBM0wVA/36M
 syvfEOmqHHPaukA36aXfFw4Ic2mKFYf3FYPE2lEI+yI8gizXqXFKDPxIvqLeOPahhtXHb3OEl9G
 Ce3IoGKa+ON3le4Sa/Q==
X-Proofpoint-GUID: TioZUdtaa0Ag3SS_AwmQ5GuXq9whdIvA
X-Proofpoint-ORIG-GUID: TioZUdtaa0Ag3SS_AwmQ5GuXq9whdIvA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99619-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BFCF3306BB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 2:47 PM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
> GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
> monaco.
> 
> Fixes: cc9d29aad876d ("arm64: dts: qcom: qcs8300: enable the inline crypto engine")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep


