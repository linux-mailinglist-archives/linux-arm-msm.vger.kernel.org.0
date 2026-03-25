Return-Path: <linux-arm-msm+bounces-99829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHqMGpm+w2kRtwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:53:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 115C832356D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A1133012862
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 10:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E5B3C3432;
	Wed, 25 Mar 2026 10:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMzm6wiL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KeLH0kb5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BD539DBD8
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435965; cv=none; b=khStJyxmWuzOnD6IAu/sT+tPbDiIKXuXFDcUIXtFEvD39/3RhJR4UkJm9MR940YC05U71MimqMrfv2Xpql42F663CQTu4chKPc2YxeQAd2g8DGMys6iZxGcja5wLSGNbxVg9Ma68A4JqyJz7MAIHDrV0YAPStDwlNnw/KR73yyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435965; c=relaxed/simple;
	bh=wmuaaOg4CnipIOHEA8jDhmtHGu0mwlaisEtJOq8v8NA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sgIyvvpSlhkmPowNSyKp3edQ5uV19DtcZBtH1Hnw0AHuDKVgyGztWm+3IChWkuX8+vaQoJgQi2UWgRrk7vsEvXENsgxqubfxelZqakltDtxwjiXWpUO6KzKkMZA3znPnChIaxB0PCyMidx7VfnuAO6KfbQ/YfANewBkHwVoCz+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMzm6wiL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KeLH0kb5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4j9bI2973557
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ReUMwUL96j+Y3C2vukr2YAZoWKe15yppO5rPQ/p+//s=; b=AMzm6wiL8DM3Up0O
	qBvKg1SclfNHoaAw42n+6CIiEfrcO7OifTXUnvdYPxA2bbyQ7XQnJ9nzL4TAXmtH
	SwJLoQhgtGfF16vK62QTY44w1+TE1B91aQ9H46Ij7DmJLxz7zO9O1fwXBG7x/g/m
	tCrt4D4sGCxpce3yqAVaavvl0sm1desidvqrziOMLiwVRMZBGGRZhmG6bsv8C8xU
	txN7MpBR1uR+Bknn/Op9EZPQ5b3GX1HZ9nsXLIZnh24OVSah5LCZIAERtzYI0Kf8
	b7jb9bm996i1mjH7Z0hwh2TnZLw7kV6jVsR0XbodtQZu/BuR16DUhG+OqYELUbzx
	aAONrw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40f4ju7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:52:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50943e69b08so46662121cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774435962; x=1775040762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ReUMwUL96j+Y3C2vukr2YAZoWKe15yppO5rPQ/p+//s=;
        b=KeLH0kb5F7b4ojksy5iZHlK75E+4MO4Xv9PznDSyJ64j5YAnIvt2KjO9JimdT1+KNF
         OVvNSjnl0PQDYK0riLUe0ESwXM5k09vDWIUNfn/Hoi/jzMDWqhtBbP/p8GgUEXf/ETZS
         wPe9nB0/wTippH+sLi9bH7bNEpRS17dDiYVtmMbeOaWaDaIfJE+3iq5+TsxVquMypeI7
         doCUShyjsoX3VCUCd0r53s7yMLHCJ3sJuxwffAMpA2UOuER4ZbMm4oUetzUwdJCOoBuL
         QBYOH7+KmijpNqaBwqtNZ5KqP3vlPyGSaFeJAD55HkP8kWOrHVO7mpzMq6Q3yiGjReJ1
         tOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774435962; x=1775040762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ReUMwUL96j+Y3C2vukr2YAZoWKe15yppO5rPQ/p+//s=;
        b=Eb1EBba1nUyVShpsD0GSRFGO4oMrwr0JjjK08gXv6ncNc1YVGDZdc7cY1m3QJi71+b
         wweFvftIKfujVmuf8tPEZXYWqxAdKP4uMT4de1b2LgvMZk0ZelZ2i2775njrXGi/pksn
         6pcAr2qJ5uFwnZaChAWPnOxRGKxuG9w+7j6Cu1nUQhSCd28D9b1XnJlmfDBYTGYqu97s
         rscidvtI07+Iz8jWqU7woUcHG8ElAgfPDlUa+9VIDiGUeWx7a5I+RFfMK4EDGdYnhFuU
         45C/k0o3HmFQAkHFCkBhVx+YXv4DQz/GIXb2UJi5DinQ5nNnR1HfiViuzXenA+mTGAbn
         6VnA==
X-Gm-Message-State: AOJu0YyCjob1EHGYkl6D1mV/FeJUqvHRg/eJan7re0KIn6YbN0nqtU+P
	ZHqhc0mHHAV31cYdKhOVqoJC6GU+m0pkIVDK6af0yBXwZrmo8brYl69zR03gwhxMfIVTwe9X6dm
	RAnDzpV5sU3iYszAdR3HnVyqRgL9MAQW3JHVisD4gu/Lc1N2HZIb0lbZUPWqaH5LQSKYM
X-Gm-Gg: ATEYQzzjqQeoTff813Vbl/Y2MtHkAI/DWQiHYT6e4e9py7sAU3rbmNiNRAhwrAj/8eG
	hlZG0N86Fa+USzm90Fds9B/Jp22M7+Fg8iMulL+dFZTHGV6jTZa8w9cyuJKTLWGI9Di+t7gBMQP
	aXwJlNOt/is04ZMwFybcJp6dpL2UdEmi35jBR8O0N9LbUkJmoUnl2foFnrHuLGPduVl3A8enScE
	8Uugir9YmYtkp0Vaen72yaYvxFMkktScgVyqKVTee9fyrFuTIY68Oq89HxfAocDYWcW3ez7yTkr
	44CDVIY9FeaL9INOdksWD5CFyt1csUsUYWEOJPXwZD8vW5aZO/Ljsn9bwTrR2zhMIeNME4j1QkH
	1jX/Tj8akZGFA0PiXZJpvA9k+5B9jh9GE9LA9CDUzOpYdJkM1XHDmULGgWnPT9eX+6cgz8sdIhQ
	nfodA=
X-Received: by 2002:a05:622a:5287:b0:501:4767:a6f with SMTP id d75a77b69052e-50b80cdd452mr29777671cf.3.1774435962594;
        Wed, 25 Mar 2026 03:52:42 -0700 (PDT)
X-Received: by 2002:a05:622a:5287:b0:501:4767:a6f with SMTP id d75a77b69052e-50b80cdd452mr29777441cf.3.1774435962183;
        Wed, 25 Mar 2026 03:52:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b133e0796sm56053666b.16.2026.03.25.03.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:52:41 -0700 (PDT)
Message-ID: <da741f9e-d5ff-45d2-9b1e-7f15f71352a8@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:52:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] interconnect: qcom: let platforms declare their
 bugginess
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Brian Masney <bmasney@redhat.com>
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
 <20260324-msm8974-icc-v2-6-527280043ad8@oss.qualcomm.com>
 <DHB05UJMTAVN.17X2QI6XGHB37@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DHB05UJMTAVN.17X2QI6XGHB37@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3NyBTYWx0ZWRfX0GJjF300FfAi
 DrARVtT+r//28ROm/EtXflrp/7QlEaWyqzadIk1hMZ54h4yLKYn6z5znL/zt3QqjNI+aJlMUMx4
 K0kYUP6dub1OhZTEJbgDJK87V50n5ArzrKTCoXm1ee9KTV4O5BqH6meceRo6TN7U248RpT1iZSQ
 YzDneVqsMjJ6tkwhi97SAMDrNx/xPU4mgugl9y4bPTz6p3uQMlg6UUncHFT3M9FnRuKgMb6Yh8v
 GNhBbC9L1p3LK0qIY9Wf4qAECHkvVQyUHyF+Lg7DwAVKHlPWu981idefU92ztHxQxDrUPg2yVP6
 kjmzKJGI4S3j3ZY1fTQsmCO2Gd/Zv7zrv/b1fpo+NzPt1r0NGoSa1TqUoAyLLJgtuDbmECUNUAd
 SVKgYDxtQAWu9SVreVTbGZZGpkJQEBF0ZbD6zl41ZlAZpfSK5UEsW7at1Hnc9UKkwiel60qxQFU
 GXI+TdemXXM+BcmaPtA==
X-Proofpoint-ORIG-GUID: DKUd6mfKXcc6hGYvCmnihv0Smof_9Fvu
X-Authority-Analysis: v=2.4 cv=Cd8FJbrl c=1 sm=1 tr=0 ts=69c3be7b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Oh2cFVv5AAAA:8 a=m7pxcdcc42vr7exHiogA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-GUID: DKUd6mfKXcc6hGYvCmnihv0Smof_9Fvu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250077
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99829-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 115C832356D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 1:14 PM, Luca Weiss wrote:
> On Tue Mar 24, 2026 at 1:10 AM CET, Dmitry Baryshkov wrote:
>> On MSM8974 programming some of the RPM resources results in the
>> "resource does not exist" messages from the firmware. This occurs even
>> with the downstream bus driver, which happily ignores the errors. My
>> assumption is that these resources existed in the earlier firmware
>> revisions but were later switched to be programmed differently (for the
>> later platforms corresponding nodes use qos.ap_owned, which prevents
>> those resources from being programmed.
>>
>> In preparation for conversion of the MSM8974 driver (which doesn't have
>> QoS code yet) to the main icc-rpm set of helpers, let the driver declare
>> that those -ENXIO errors must be ignored (for now). Later, when the QoS
>> programming is sorted out (and more interconnects are added to the DT),
>> this quirk might be removed.
> 
> For reference, these are the errors I see on fairphone-fp2
> 
> [    5.534806] qcom_icc_rpm_smd_send mas 8 error -6
> [    5.535010] qcom_icc_rpm_smd_send mas 8 error -6
> [    5.535218] qcom_icc_rpm_smd_send slv 16 error -6
> [    5.535445] qcom_icc_rpm_smd_send slv 16 error -6

I only checked these two, but 8994 (basically largely reused design
thought) sets them as AP owned intentionally

https://android.googlesource.com/kernel/msm/+/android-msm-angler-3.10-nougat/arch/arm/boot/dts/qcom/msm8994-bus.dtsi

so I suppose the fix is to simply denote all of them as such and go on
with our life!

Konrad


