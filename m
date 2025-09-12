Return-Path: <linux-arm-msm+bounces-73345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC7BB54EE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 15:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DFB01CC22AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 13:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B0C306480;
	Fri, 12 Sep 2025 13:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTgoGUyB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCC83064A3
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 13:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757682625; cv=none; b=ZuyCEVv3HLKK8FDroJaAgjBT6PlHcpWPWgCgX7NB0fIym+IgbBTUFsp8y2HjoOAK8QpJ5J3MqKiW6JnsT3JqPZK64VORtCYGPgPdCd/zncZUKJQcif00ncluNuNEZXynYlh7YQraGyS2eP8aLWRNsqHVjhZPm80W6fCKPsJb0PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757682625; c=relaxed/simple;
	bh=XxEsZ9QOT0wQkWJJQFHlMg2enGMiE5WFQwRa1OzgxBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jtfOxOpvlEMFj9RtBimIaTO6jKl7zcaR8L7FjfmgkW/BvRvAmqXO7rFOVZM3APOxl+hWr+cBssrotVAIS3g3fjCCE7rwPRGei3zgvXY3TZMSng4ABNzv98HMOJrdzQDOTiIETpYrXkWsZo3l2IawlnVGiXgL8eJSqcnDWfxlt+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTgoGUyB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fKjA017561
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 13:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ZuuUGQBOUzotJ0AURfxJazlW1Inl9eU+TFGm3oovUI=; b=ZTgoGUyBjEMZFNQS
	/v1ug3l5ayfZ1NUAmXaqbuY/xD8fsKCCWQ0bT1IeV2x72MHekl0IE9wgfbMOQfYu
	PKmfc1OXQ5Dy3Tfq3lcU+c+aeCX5BZ5kz9fHrcU1MPBRC/QIwylIufxCD7WdDoRg
	NIKnojqdjmx22J22MjbE61ihhSA28a021AMeMIlDQ3PnVInDAwsudSQ77O+rdiFZ
	bk7Q5OIkJ4QXOn4YELmUyaTppAUmL1gj+6oNSmPI4w1r24tKj4h4bI3BYARzbn9a
	7d+PxUh6qcwpH1CDKXLBsMznRjTfQl+woNoZyoPH3E7hZGQiKhSxGfgZWVz4n1Pw
	GBfN9Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwskv50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 13:10:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b48f648249so4309651cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 06:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757682621; x=1758287421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZuuUGQBOUzotJ0AURfxJazlW1Inl9eU+TFGm3oovUI=;
        b=KErSS6UH9SE5gQGrCeWLo1FlXKZfmRLZ4RIf1tr/T6QrSFBCYxlxFC4QwK4enE/TnB
         5GRo9QkyaIySWoFHpJoyjfvv4K+wzx9kaAk6Iu3xrrBk1UfCOUVCK4i3X5083VPm+IOl
         jVRKIGBKV/Sgvfr9FRf14z9wpKGuzSkIZOpASnlw0yi3uK8rj0oPCBNiiwP1ghUPyZmP
         18rQNg0ADXRQRRxmz0eEv8JFi2OWsEYdy+zA/1pQ7E1l3TisPoKiBjpoc/yYc7ai5csN
         UfsyIIdrhbFFptI0NgSBm8ynKfd+Okg/iX/YIfX+r0JKBzpgcm6AydWwGXJzWhxmsDf0
         PFLA==
X-Forwarded-Encrypted: i=1; AJvYcCVObo6tL6XCcYsdtON/nfBjpJXn+2xpyWtNH/T197wHJIfU2iS9A/TjWVts9nRXPyW/RzLHtlq6tcwgFuIB@vger.kernel.org
X-Gm-Message-State: AOJu0YyfgVPvLBLvEwrwXuO2xKLkfNXgWRFSIR1nBMvBWl/Avx2WEeyw
	NI4O+K2lkcPTE18sIZqHQPrIMa29Vv7wOsWrXYds4dq2XlFvDKqFqc8ScfunZtF3Q8W1nPv/z5s
	MMrHla9+hVm7ZN8Jrnp4iJB1cyNBozbnIeWWRVSWGM+VuytEkoCfcrwVPhOieLVDNziXo
X-Gm-Gg: ASbGncujU0wKnNROsQW702wpCfUOXLM4Vb3VKiYrDJw77Duq+89ajO4L43kZE6wVVsh
	+XLq1cyCLYJwuYDm41KZ4p/TBcD76RAIIfczh72x8QMr4OPE8JjAoC8EFE7VwJt9h/kC6PbLfza
	6wlNjuYYrNx93qp1kt0I0yk+yCjOt84ppUkHVtzQcwf64yUgQswB/x/jj3tG/lmar3vaSrsVmcy
	+Hn9jbl0ipm82HG0xqOqrmzb2Tpyg45D7heGd5YvELNZ1x9/E6raIPFSRhDKM2NYo0iLhTYFGPf
	aA1gLI6h3WmTDsp9Wm0cLR92Z86XhNr3rap6eEUPZSHs4Mp9zVU+bCN7lkRDPMHIjuwspCb3nAF
	0Nlv5WSldI4aOvoodZ4hTTQ==
X-Received: by 2002:ac8:5806:0:b0:4b5:d74e:d938 with SMTP id d75a77b69052e-4b77cfe5dadmr25023741cf.7.1757682619550;
        Fri, 12 Sep 2025 06:10:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtUQ0IdF43jy/a13JRBEqJFoXoR7rc4LuhuJEDHtu/h6Dyxy/yIzIQdCwYyyFQseAWi/7u1Q==
X-Received: by 2002:ac8:5806:0:b0:4b5:d74e:d938 with SMTP id d75a77b69052e-4b77cfe5dadmr25023131cf.7.1757682618785;
        Fri, 12 Sep 2025 06:10:18 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334ed29sm364920566b.107.2025.09.12.06.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 06:10:18 -0700 (PDT)
Message-ID: <b51e1230-d366-4d0f-adc8-fac01b5de655@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 15:10:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sc7280: Drop aggre{1,2}_noc QOS
 clocks on Herobrine
To: Brian Norris <briannorris@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org
References: <20250825155557.v2.1.I018984907c1e6322cf4710bd1ce805580ed33261@changeid>
 <20250825155557.v2.2.Idebf1d8bd8ff507462fef9dc1ff47e84c01e9b60@changeid>
 <90b13660-1844-4701-8e63-7fde2f093db0@oss.qualcomm.com>
 <aMMcNn82AmSavJYf@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aMMcNn82AmSavJYf@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OjoCRrCyb01JSktyOtpKFAiQZXRKJjfG
X-Proofpoint-GUID: OjoCRrCyb01JSktyOtpKFAiQZXRKJjfG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX4r7ZwebIceqC
 nMpuyCpLsRD6TRRnswT6wwlqbS9Iolteun6zdI6KGWZoSPDmXbYcGBeEES0wHynOQp7I1ueds6o
 fiWLFibZIGzqc8gL2WviFkp2VGlX09n8zPufAH8YDZVUrkYmsPTNd7zuzXBBY2ZSyVyZbpl7b8l
 GuKy43pJoLhKnFV81jpsFfFoGmYj6txvhMUDRHg+yUsg8PGREznyBGihy7aaRipNUeSt01jvMKT
 QP+xE0p+yRCwDCbMGo/ezvwqN2t+XzbStqLsN11C5v2dou3TYqwIXOhChnBrPaxFYJjaX6Vlsad
 5yL5VdzpH/t12+SUlqfv3hRfJKPXIq5+p+Nu9ppJ03rF5MomUzbbMdQWDJQb0+tXmgFMc6PAyhT
 qgnCgKCN
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c41bbe cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=JMB2q793TmbAW5wj82IA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On 9/11/25 9:00 PM, Brian Norris wrote:
> Hi Konrad,
> 
> On Tue, Sep 02, 2025 at 02:02:15PM +0200, Konrad Dybcio wrote:
>> On 8/26/25 12:55 AM, Brian Norris wrote:
>>> Ever since these two commits
>>>
>>>   fbd908bb8bc0 ("interconnect: qcom: sc7280: enable QoS configuration")
>>>   2b5004956aff ("arm64: dts: qcom: sc7280: Add clocks for QOS configuration")
>>>
>>> Herobrine systems fail to boot due to crashes like the following:
>>>
>>> [    0.243171] Kernel panic - not syncing: Asynchronous SError Interrupt
>>> [    0.243173] CPU: 7 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0 #1 c5464041cff584ced692726af2c4400fa2bde1db
>>> [    0.243178] Hardware name: Qualcomm Technologies, Inc. sc7280 CRD platform (rev5+) (DT)
>>> [    0.243180] Call trace:
>>> [    0.243182]  dump_backtrace+0x104/0x128
>>> [    0.243194]  show_stack+0x24/0x38
>>> [    0.243202]  __dump_stack+0x28/0x38
>>> [    0.243208]  dump_stack_lvl+0x28/0xb8
>>> [    0.243211]  dump_stack+0x18/0x30
>>> [    0.243215]  panic+0x134/0x340
>>> [    0.243219]  nmi_panic+0x48/0x98
>>> [    0.243227]  arm64_serror_panic+0x6c/0x80
>>> [    0.243245]  arm64_is_fatal_ras_serror+0xd8/0xe0
>>> [    0.243261]  do_serror+0x5c/0xa8
>>> [    0.243265]  el1h_64_error_handler+0x34/0x48
>>> [    0.243272]  el1h_64_error+0x7c/0x80
>>> [    0.243285]  regmap_mmio_read+0x5c/0xc0
>>> [    0.243289]  _regmap_bus_reg_read+0x78/0xf8
>>> [    0.243296]  regmap_update_bits_base+0xec/0x3a8
>>> [    0.243300]  qcom_icc_rpmh_probe+0x2d4/0x490
>>> [    0.243308]  platform_probe+0xb4/0xe0
>>> [...]
>>>
>>> Specifically, they fail in qcom_icc_set_qos() when trying to write the
>>> QoS settings for qhm_qup1. Several of the previous nodes (qhm_qspi,
>>> qhm_qup0, ...) seem to configure without crashing.
>>>
>>> We suspect that the TZ firmware on these devices does not expose QoS
>>> regions to Linux. The right solution here might involve deleting both
>>> 'clocks' and 'reg', but 'reg' would cause more problems. Linux is
>>> already OK with a missing 'clocks', since pre-2b5004956aff DTBs need to
>>> be supported, so we go with an easier solution.
>>
>> Just to make sure I'm reading this right - the clocks enable just fine,
>> but it's the writes to the QoS settings that trigger the hang?
> 
> Yes.
> 
>> Any chance skipping qhm_qup1 specifically makes things better?
> 
> Yes, it seems so. Or specifically, this diff:
> 
> --- a/drivers/interconnect/qcom/sc7280.c
> +++ b/drivers/interconnect/qcom/sc7280.c
> @@ -52,12 +52,6 @@ static struct qcom_icc_node qhm_qup1 = {
>  	.id = SC7280_MASTER_QUP_1,
>  	.channels = 1,
>  	.buswidth = 4,
> -	.qosbox = &(const struct qcom_icc_qosbox) {
> -		.num_ports = 1,
> -		.port_offsets = { 0x8000 },
> -		.prio = 2,
> -		.urg_fwd = 0,
> -	},
>  	.num_links = 1,
>  	.links = { SC7280_SLAVE_A1NOC_SNOC },
>  };

As I attempt to find a board that would boot with your sw stack,
could I ask you to check if commenting any of the three writes in

drivers/interconnect/qcom/icc-rpmh.c : qcom_icc_set_qos()

specifically causes the crash?

FWIW they're supposed to be independent so you don't have to test
all possible combinations

Konrad

> 
>> Could you please share your exact software version (which I assume is really
>> just the version of TF-A in this case) so I can try and reproduce it?
> 
> I'm not much of an expert on the makeup of QCOM firmware, but reading my
> firmware logs, that'd be:
> 
>   coreboot-v1.9308_26_0.0.22-32067-g641732a20a
> 
> and
> 
>   BL31: v2.8(debug):v2.8-776-g0223d1576
> 
> IIUC, the latter points to TF-A hash:
> 
>   0223d15764ed Merge "feat(docs): allow verbose build" into integration
> 
> Brian

