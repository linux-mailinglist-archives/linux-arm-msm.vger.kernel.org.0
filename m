Return-Path: <linux-arm-msm+bounces-98362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4P6JFHBtumnRWQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:16:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF26F2B8C4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21F493010BBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66DE39C625;
	Wed, 18 Mar 2026 09:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kT6Qve4G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ioHrCbK/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA371B87C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825385; cv=none; b=tpdukmkbvV0YJEQUyvdSx7M/SJqY4+RLqdRwcDGbyK6tNE5lXuLwL5xLlvvyrtD9WE7RlbYGhq54p5RjIDC1hZEX3Y8rwVfvyD/cp4qQJM1OUpptPsM3DQD5LOJWkPDdoU3vuu1TI7WCQpvEeuoWYCTJJHreuThPE7R0Fie5YZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825385; c=relaxed/simple;
	bh=gG8YpPBJWHTKKOsywTFckQWTjFllfY00ZZmBdj+bCE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3ZTv9ay1MxtX9PwDRNES3CAQMixeGx7paGM5ikMqe4/vdfiHumRJVF4vyk3OwUi0kdcpWZ5IcXD59aqlGhyPj2aqPe4x7E8SekGybXoov1WGC/bGgqcM5FPUy8c/Ed3wtuCJkLlRNhCpBiRV/3gTBlUd+my9/y4jbYIv1KxtUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kT6Qve4G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ioHrCbK/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8uEw62293882
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WBO1GQf6amTvBiVYZDCx47wmVjgPF6ImMey27b4pnBw=; b=kT6Qve4GPxrZI4ic
	hSKqSHVYc6HLS4/zHWccCNR/6lGw+YmPacmil95xKsg8yrcb6HzC2nD7cKAP6BQn
	WMLjPyEVCTWZNi4qOEgZN++Fxwt0afM96UtNfvEbdErK1n0/a+Hio5CNQ+2yvFjf
	u9SaxV0UBOzn6Hhe9BlHOIskwAfKoa+zVzLqgwVehbuedOFYumgmY9ErrTGRBgq2
	OQ/dL7zFDv55cUicu7+SMlwdC1hpzkCvDS6Incn/PxfgoAYGnwWN6PN1j2fUfXde
	0lIDEG2gVM82AJlSB3LngONeM0at83s3+NFr5DnuDHahcQeDlXgdeXRT9TVTrEf4
	42hWuw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya83unfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:16:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b04911610fso7871325ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773825382; x=1774430182; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WBO1GQf6amTvBiVYZDCx47wmVjgPF6ImMey27b4pnBw=;
        b=ioHrCbK/50Fg7Wn0TSV3PZEDl9BhZkFlStiV5rSjeZWRqUZoRU1anDiZ1J9W4KogMq
         nhzYyNIRJCniQLlfxtNIcSDUmYLeoLKpyjpgzw5xd4EK2/+vFUBTU3ylsyGAXtIU6dMF
         3dYun1IanzibcGaexcD4qXar6JVw3RhruyYcRDxvo8mCNHTAMz1okuIMMbrcTeRfi27r
         JRFtRrzV4WYSdiD7nMeuyIl4qSNGhc/dGhWhyU4Chcn6KJih6qexS3opLyZF0i6saiZG
         SEj6VQymfa0p4jcnnQbJwJ6nQ3sLhCIAj2aY6o8Z9ugv26oJKMcIZS0tZKoye0NZnzqd
         tbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773825382; x=1774430182;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBO1GQf6amTvBiVYZDCx47wmVjgPF6ImMey27b4pnBw=;
        b=mYQ6/uj+qPrAMrl/NSB6J/w0EAVMt6xK7DJq37iDEiKhdm2I5ItdEbNkY3uf3seNSq
         ywBZch/ald9JocPiAluY+50g/aMtIjt0NjRACpS5ysFKapEEG08Uc53o9J8pEkIsFnlr
         OgX4/wIOXeEU5v7d0Cj2Hoy97aN2s7Wql+b0aFuX0IGtOU7R54cQacBUvplofxblxow2
         zvK3mshfSJ9ytk4P1zO88Mwo5s+DhZi6JmIZaOxC/HSrTAaMY/fS0Khwaw65GmNcBXet
         ARf9d8BKJV4Sz4qTx/rsyBagP9giS7RPx9T9QyqyuMmL2qYlHsyTZp7S6LH6hw5Wzplc
         LMCA==
X-Forwarded-Encrypted: i=1; AJvYcCVo0tiSsyW2lN0hxwY28AZh+4ItInBJYp2itIHKDYUPgctnU6Tcfq6U3VMC3IZoYhgjqulsydeq2+HawbWo@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu++/X48XINnE9axelsWtuqNCm0gqHVhjXYX7SW68p7Cpxh8Ru
	xM3YsVNWgakOtnSzuCOaQJot3UKNGFB/IICyZz2Fy1SU/QFiisqBMp6zITpm5y19d5qco5VINNB
	HkcEqOtpt0LX1EwvnNDj7wR4m75WycZ5/wuN/kfs1/zxXGCp0unn3nxMBHfCEuBXV6YBg
X-Gm-Gg: ATEYQzyggR8o4stB8R7JOBJgQ6Pfc1EKSfK2j2DOeDrFukgnZA+M0dlEXwZNUnONExZ
	8xGApYAUYa9POQ6xAAHOAjDT+cDRK19JYKUyb2fS6BM8Tm38iKXFQuDbS575ZUlVGSrzV+D1STK
	q1+8wVD4JhOPJGF8wTKK6tnFlfRaV8JPclUmKiXmTIXXYA7rjKdLoj+UICD8ufHUeZJgyHQjCIw
	UsqopWX/uBUKuYFYUHcHVMDxgx0UwFNCHS1iQcMxdb2mwt2SnklAfMbfvGBiZXLN6vdSA6148oG
	NURgALwbao4Nc4aN142DhOo8cGrqmW2pTcuQvxGp4cJ8RZmiC1YAkgr/uzxbSMPRaip/1SxtATf
	zUfhvulXV7z/F/F8X971USFqpvXKZGzuUyfUFBZ1w4Rqce05lZgh9jQ==
X-Received: by 2002:a17:903:1b0f:b0:2ae:5426:da49 with SMTP id d9443c01a7336-2b06e3e106dmr31483495ad.34.1773825382333;
        Wed, 18 Mar 2026 02:16:22 -0700 (PDT)
X-Received: by 2002:a17:903:1b0f:b0:2ae:5426:da49 with SMTP id d9443c01a7336-2b06e3e106dmr31483145ad.34.1773825381818;
        Wed, 18 Mar 2026 02:16:21 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5f1245sm24693345ad.46.2026.03.18.02.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 02:16:21 -0700 (PDT)
Message-ID: <9d9a8381-e174-72ef-6e69-1b26de07da67@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 14:46:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8650: correct Iris corners for
 the MXC rail
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313-iris-fix-corners-v1-0-32a393c25dda@oss.qualcomm.com>
 <20260313-iris-fix-corners-v1-5-32a393c25dda@oss.qualcomm.com>
 <8dd814c0-039e-c8aa-2588-9c1edbadaf47@oss.qualcomm.com>
 <scsvyc7vb3lnk6mktwltdac5bkynvrzd4jrx7dwceeesbqnhrh@clz7d5e3igkk>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <scsvyc7vb3lnk6mktwltdac5bkynvrzd4jrx7dwceeesbqnhrh@clz7d5e3igkk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ajArMvAxjQXlixzQ3-2YlQXdWD8cBO7T
X-Proofpoint-GUID: ajArMvAxjQXlixzQ3-2YlQXdWD8cBO7T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3OCBTYWx0ZWRfX2W/QGiOzO0Kj
 N49B99XBTg1osqsDvwvEcSRyt0hYvxhZhSE7y752hFpAr27LGWO0Ft2/ZZ7lo8yBjeHOp7DwpR9
 RgD/d/0I/NFCoKRJ10Go3Xtc/A2sRAmYnI/iicBnjkQmiFSqoZIRyVBSNEq/dkjCAYDJZHyFtCt
 x1nQUHkxDcQeSnqBPn4BlU7Me3KQdLfxIwSdat85MVj/DDQNn/Tfg/ca74IHf+rerLeZB4XTlyi
 kWNjDGNQsV90GlzIwW1RGzGCPX4nIsxcdYnlNYS7zJrDbw+uD53keG2di6NG3Cf/cK1woFslOn7
 eXXp2cWsBFx70wv9YnvMFouc9HL/oCOVlj3UIT4OEknk1Xh4JdejXLfQm646BQwcWFji68QfHTv
 dhYkq9+4CINPyPjcDYLWGBg9UIhMryALNHkF8BAkjPn3nAjovAi9fViuIBizkoxr7A5FMz5A2Lb
 kx5WMX+y9FZbobF7DwQ==
X-Authority-Analysis: v=2.4 cv=Y8n1cxeN c=1 sm=1 tr=0 ts=69ba6d67 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=RgczR8+8wRjDfzPIf2UjDw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=BSPgCQzljRD-_oUiieYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180078
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-98362-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF26F2B8C4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/18/2026 12:32 PM, Dmitry Baryshkov wrote:
> On Wed, Mar 18, 2026 at 10:54:07AM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 3/13/2026 8:57 PM, Dmitry Baryshkov wrote:
>>> The corners of the MVS0 / MVS0C clocks on the MMCX rail don't always
>>> match the PLL corners on the MXC rail. Correct the performance corners
>>> for the MXC rail following the PLL documentation.
>>>
>>> Fixes: 56cf5ad39a55 ("arm64: dts: qcom: sm8650: add iris DT node")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> index 357e43b90740..9437360ea215 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> @@ -5236,13 +5236,13 @@ opp-196000000 {
>>>  
>>>  				opp-300000000 {
>>>  					opp-hz = /bits/ 64 <300000000>;
>>
>> I see in the document that this level value should be 280000000, could you
>> pls check and update accordingly.
> 
> I cross-checked, the table for SM8650 lists 300 MHz here.

Ack.

Thanks,
Dikshita
> 
>>
>>> -					required-opps = <&rpmhpd_opp_low_svs>,
>>> +					required-opps = <&rpmhpd_opp_svs>,
>>>  							<&rpmhpd_opp_low_svs>;
>>>  				};
>>>  
>>>  				opp-380000000 {
>>>  					opp-hz = /bits/ 64 <380000000>;
>>> -					required-opps = <&rpmhpd_opp_svs>,
>>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>>>  							<&rpmhpd_opp_svs>;
>>>  				};
>>>  
>>> @@ -5254,13 +5254,13 @@ opp-435000000 {
>>>  
>>>  				opp-480000000 {
>>>  					opp-hz = /bits/ 64 <480000000>;
>>> -					required-opps = <&rpmhpd_opp_nom>,
>>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>>>  							<&rpmhpd_opp_nom>;
>>>  				};
>>>  
>>>  				opp-533333334 {
>>>  					opp-hz = /bits/ 64 <533333334>;
>>> -					required-opps = <&rpmhpd_opp_turbo>,
>>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>>>  							<&rpmhpd_opp_turbo>;
>>>  				};
>>>  			};
>>>
>>
>> with above comment addressed.
>>
>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>
>> Thanks,
>> Dikshita
> 

