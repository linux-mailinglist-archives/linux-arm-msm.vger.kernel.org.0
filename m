Return-Path: <linux-arm-msm+bounces-91463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4A+EGIx6gGnE8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:21:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9DDCACB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F243304888E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47435356A1C;
	Mon,  2 Feb 2026 10:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aotjcpyM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBQsV3oT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E642E972B
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 10:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027182; cv=none; b=DXTAfm/6uuE9KG0vHSTlL/qoqubXe/980XctIlbnqaIkmJM2bQAoyGJvCXp5T06BMqXFoYztAetQh9gfqrocr3uPDFbdxgx43Mn8xuEYilF3FnppbbJK127ItnDz91rB4RUgalOFC7/VdnUTvVRlvLkIIMWmUa88Owy452qzJGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027182; c=relaxed/simple;
	bh=1jmLK14LqxG8z+7yjYgdbBHNfz60JYyrT36cz58Vb6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zjln//KTsUM1pMfuWY0a+4+/LQLCg/4DGb6XH3LngUvkqQBhd61TZajlCTu7GmhhPLft9/VYPqHWJ2AxAezFHhmBWgNrB/I3PaOsGx2RUS4u5T2J2S+gK8W6tu0q20dI3bHCJcgb1Aw1azIEqmjEdyDRoHQWycrk82VPFd2aMYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aotjcpyM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBQsV3oT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612869v62367015
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 10:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/pT6iNPUZ5rIRZHrVV5FEzyGpeE2uo+c8pdtnOAtf5M=; b=aotjcpyM4a8MpgJ+
	cycnt1eKnB+tpLvrWvhhqGTOK2grvTyzbagbBbmBfvStkuvNviWy9O07DrjoPfNn
	lKGxVEE0uJvJXTAZxTdqHL4cvKsX6UpHclbmD4MSEDVTG9Aqg8GUmBsaqIx5z5fT
	pX0wxcMstjQXRnePOtLX0rVHPrXL1ptKY1z7geyELgRelpjcz9pPDMlLl7ZIElCk
	7TcFafuRpVw2Ckp+xPqjLpILYAnI9XXbOJwyR79G8RoYOoVkJLtUALTBLsqIPA1e
	fbu4jVTD5caGJayRSPCYY+hqr7f2U7V/rYqdYhAr/UO+gpJA+5VcbA3UxVCMFue4
	b+iJ6Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1ard514t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:12:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a289856eso1568685985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770027179; x=1770631979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/pT6iNPUZ5rIRZHrVV5FEzyGpeE2uo+c8pdtnOAtf5M=;
        b=KBQsV3oTSi6xU0o3O5q1TXbWnCyhwh86wFYINz4tPEIHBL9J8QvsM2Zlnfa+wq7ukV
         4hmSmFwkoUzcoVuvsny0psZdSvCfy1mvKh1elewMgLrvPchszIBQqq8N14MWs7+MRDaP
         j0HpliMAHq5s2jf2VRGEGncVAMFNQdQuQeVftb+cBQbvzPNw31Np2rNVoMKZOFGUdIL9
         iZt02kxfKXPMhCAHBGJkMEvHaYbAS3rfbXgjTBKIeP1tCXFBITT4HdOozf/PUaMUtWE/
         7+R2EXfjr2C8pyJK2OtfYm2Lzxnqh0aBdgkFjWHkona/tu5coAxzj+h1fwZUZkvQo54J
         huRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770027179; x=1770631979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pT6iNPUZ5rIRZHrVV5FEzyGpeE2uo+c8pdtnOAtf5M=;
        b=F2C+mLull8MyQNG2p8As3hokJ0UJGxgeAWHo/oP5LrdkW6wlhSc/q+WNKFmhmhedtH
         jaFahkw4XOGJx6GkNRpTrd9uz4Doaz8l89RmTa7IIKXacPHHLHJD/CceKeiy+LSMzvK4
         JyHj/K5xhiKk1ME+EGELkK3m10VYMK0xjdaS5YTorjALvjH5II48ICZ+c7PqfIWJWsW/
         mmmjt2TDtgINsZZRuVB0oN31OU+V8QyxlFGIfnuURA88bp3+kHk35KyS29UCv+cD+SI+
         /Gl6lbRYp58NOXvLgYyY3E8ObSDX5Q7mAqPGNqDlMKLrd8oMu7R5T2PN1lBAfQMIytMw
         N+KA==
X-Gm-Message-State: AOJu0Yz1gEcNiOw/ozpWS51Ga25jrLzytCUwwK1XNa0QsvhCr9PqOy6X
	4GfLYjIfiwxiGHZe6L5xHcHxb8xe6BqQ3MzWTXecjPnG44pmxVc3ABUq4TvemruiG/B/YDx0USo
	UejgWIcPOZu1tBPPtlMtb7ILPZwDfV8I01VxqTzYmcLJszJFYU5uY2t/iiIzNAWkb+58h
X-Gm-Gg: AZuq6aJKab3ZwOeuEVsZAWN10avLHJ4QnDCSXDvh5p5Ear9jjwNERoyXyJTUIzMPuzs
	oAuXN/ZuVGriv7KAMkbH2HqjpFnV/cxnlA8/FWHHSSrin9JCiIYpPT8XbU0SR8aywZpjcNWtk89
	xegqtNxUO9hk986QU1hj1ZiJhE16emxsiVuZVs0VB/MOyINaEXJwni+tN0iOfZjqKJMA5VQWSpJ
	mEzWq/j+eJYkbFRvs+b63clVnLeFQ8Ch76oJ3MsZVHYkP9s4ZISv80DOy3nUYVv3PaJqYLm1xOb
	C+s1/VFzJBn2BLq6h7FndTYSsX1QFkh2fzPHxIt0egUt25wGViXuEy14KsfOkdM6P8jYHJP5KFq
	7X2hOPye6lttSQ1BBUHO+9JHloaIlhdRBT45nud5uoGzXUtimsRYn+6VxaQ9R+UXyDWbbUkK5m8
	qkHSAM+zR1MBmq5avx8q6SmMIY2YjVu9nzbKywj70f+skdQFRoKhyoCiZQVnpz4fM=
X-Received: by 2002:a05:620a:9489:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8c73ff0d649mr1145392785a.15.1770027179088;
        Mon, 02 Feb 2026 02:12:59 -0800 (PST)
X-Received: by 2002:a05:620a:9489:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8c73ff0d649mr1145390285a.15.1770027178630;
        Mon, 02 Feb 2026 02:12:58 -0800 (PST)
Received: from ?IPV6:2001:14bb:15b:d5bd:79ce:863:9a22:aae2? (2001-14bb-15b-d5bd-79ce-863-9a22-aae2.rev.dnainternet.fi. [2001:14bb:15b:d5bd:79ce:863:9a22:aae2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c44cbcsm29528431fa.7.2026.02.02.02.12.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:12:57 -0800 (PST)
Message-ID: <ace931f9-822b-4756-8c23-f69963ffac02@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:12:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] media: iris: scale MMCX power domain on SM8250
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-4-6f40d2605c89@oss.qualcomm.com>
 <95977a30-616c-44af-ac93-90bae2bed298@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <95977a30-616c-44af-ac93-90bae2bed298@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfXwDKeC+1+5XLj
 CiuD2m/HM5BnIb1WB6pR8pOeY3qzAX9qaDpvawW24ZJZbO2M+hSMabu7uy+Ak9BxMaMXvpEA5GY
 hMv/c7SGOYfsbVGqtboeJbB/rtbQv5qjW7iOQO8BUjPgJGBkjmdiUrJf0OiTsY0VuV4xAFLU320
 2Fp8ibvrotrhAZn8Np6NIWHGyiclvPp5ECyhnvC/NOH6/81qbxOa8pQ3HNwvlyS1VyKlffeWwCp
 rBJJG/oGbWDKp2jByNIwzwVKwnv2kDO/Or2pzdCrXglMb1/dsyx1O1msHqnT0Tw2b2t5c27odQ6
 HVW5Xq3JI0SWWePYRXbK+WsNMVS4XbFQ3O9zbSWO+imNMMXuB1fSJZMvH0nB0buu32AfbBLHCtj
 yj0AHzgwYkUF0DxzSSf7IuQXGvXeQYDIPa7ECwKxIfw8lOZcqgVeFLQ99eMQVBIpGF4dmMKda5e
 8O62SVGOhO/zAPFrYzQ==
X-Authority-Analysis: v=2.4 cv=J6anLQnS c=1 sm=1 tr=0 ts=698078ab cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dCPk7noOixveXNiBySQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: u7SyeVg6elUN2vP2WF4KMZi7hu3RlCX7
X-Proofpoint-GUID: u7SyeVg6elUN2vP2WF4KMZi7hu3RlCX7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91463-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC9DDCACB5
X-Rspamd-Action: no action

On 02/02/2026 12:07, Konrad Dybcio wrote:
> On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
>> On SM8250 most of the video clocks are powered by the MMCX domain, while
>> the PLL it powered on by the MX domain. Extend the driver to support
>> scaling both power domains, while keeping compatibitility with the
>> existing DTs, which define only the MX domain.
>>
>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
>>   drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>> index df8e6bf9430e..aa71f7f53ee3 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
>>   
>>   static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
>>   
>> -static const char * const sm8250_opp_pd_table[] = { "mx" };
>> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
>>   
>>   static const struct platform_clk_data sm8250_clk_table[] = {
>>   	{IRIS_AXI_CLK,  "iface"        },
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 7b612ad37e4f..74ec81e3d622 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
>>   		return ret;
>>   
>>   	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
>> +	/* backwards compatibility for incomplete ABI SM8250 */
>> +	if (ret == -ENODEV &&
>> +	    of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
>> +		iris_opp_pd_data.num_pd_names--;
> 
> You're decrementing 1 to 0 @ this point in the series

Why?

  .opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),

  .num_pd_names = core->iris_platform_data->opp_pd_tbl_size,

So here the nom_pd_names is decremented from 2 to 1



> 
> Konrad


-- 
With best wishes
Dmitry

