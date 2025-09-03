Return-Path: <linux-arm-msm+bounces-71771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E155BB419DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 637DC1894F06
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CAFD2F069D;
	Wed,  3 Sep 2025 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VsczgInH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3F92EFDB5
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 09:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756891557; cv=none; b=KOxihIy0ejuvtkJm9awaP19AoaU4C9MHvSUsH3EQKhtdifm8IUapFFXXZ775YaPUweXTTJ0qw5W5Cct/zRZJLW4GsBCZ0gOPqGueGzY+Y4aTTh6vOJ0ZhPeipM0+339KgA00lsn2g/V32dKAWHLsEe68iJ82PAexFNb+I5Fz/N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756891557; c=relaxed/simple;
	bh=tQi2QB0QE+ylzKAWeOhCAaWxxpDIYV9un1Qgsckd9hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ae+K44rFWlml5w5P9mvXXVGVYK1UGz9taFe748UuexXE/vT0CWiinMTfM67NWw8IA3YPq3293kL2THpP4soAA+ol2iynYISZ5d32spGgIqcE4DcKPaxAdURnfmHabeGU0ILYtCjRzO4ANfL+XQVUvUJ+Z6Xi+jtBmNCbnDVtZHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VsczgInH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5831xlrH012685
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 09:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V8xcTnmvm8vaCs5GzeHhTc9j2HG7qNwDmT3oTLQQlSE=; b=VsczgInHphxWEvck
	od5TCtrl9ghVLbLTHWdb0twQmaBhz6ybE47LtAXoOdfY9++I8DJYxKsiud5Xn55O
	vfkjfXP7jf/+n9Q6rxnluj9I9cPujwDFDSC0Pr171/rktCL7xfvGMvZpEUv/qEyo
	6Lh6EcvbFpcbMqwoCfAJRc8kPR22oA2yUuu9MYDEwZ8f90Py1i3848QbbqgrXSF/
	QjcPKVSflYpDj++vKFOvi467eEmg2eoISAXepz9skJQrqWPgB4+pLHDTLqQecBuL
	fYY4Ha8IpO7bvph/u9CawZB0Z9dbRZaG0m97e6Y77SVYnikut8A7jZ3m9sORz9FJ
	ISXUSA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk92tac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 09:25:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b32dfb5c6fso14949001cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 02:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756891554; x=1757496354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V8xcTnmvm8vaCs5GzeHhTc9j2HG7qNwDmT3oTLQQlSE=;
        b=udGgqKIYf15byR/+9qxV7/t0OFatJ1N8O+nyj7maw5DMSSAenOXsTrJoiPJPl/rXne
         DzwmMRZ/DeQIYWDOoeX/ldA4jn1XolXgAB04CbakLwbhT0BL0n3koBrUUmi99er6Y735
         /YOB97DZUt9Y2NvR9Gwlgapph23VB+o6bllfnHtS5Wr7wraJbIC+SsJdC6A7MyWdzuP3
         jlL7t7GPulmXk/GRQeiL1orOv6BWZR/AMzeHXxMweS6F6rZD6BgiE+FdzVy7e1JISMll
         EPp6MCDg1SI180qzAYcph1iKdzOOtKMFTirChY8Ob2ExE4HUeB3RjfXFyYHdmVwtfCed
         HDmw==
X-Forwarded-Encrypted: i=1; AJvYcCV6Gu/XcGKBmOQhMviJlAyip5skgehQ/KgbhQ9pDfe0YO8YJxeGpTo4DQ4cz41HIXYr5uRsrnhyaTN7JEP0@vger.kernel.org
X-Gm-Message-State: AOJu0YzTDvOBPIlXp2Vhdbc5mCuVt0nKRBYHz9xbh59h++AB8W6MpmrI
	jmnrC2sSCOlpdpcti0zQZ4wPIguoOF09KhKV6sPOFybsMUqKrlAJn3e/HfuXwBT6Qdv4AOMmTn7
	Iq4mHkxPgBpWuXtYn51xdls/xOUi4lrrY7lqmhDAepnh7kIdisDJ9p1wl/QYEAhJtC2E2
X-Gm-Gg: ASbGncvGlPjDSfi1fj2Ss+h5sqXmoXiItqgTADVX1yH706tW40QCLaSAQeFLimlpQQg
	y81isyw+ryU2bOZ1qKg2TPctren0q7xmLz2kBcbKaWWVoK0hQt/8yNQp4rZ+K0v/fimzbXqgPui
	oALc7B8Z+rkTe3OpWmeaiGMoO2PxooyjS3bI7ykMrdcUEdTsG1eRxs7QpnRzmftqPJu1UgKWjI4
	4J50enHwBqG/leMfN/85PLOFCRjCeiZsyF92uAD826wiDAwe6ll7jyaJeEH0HdO5bBruNZQu69c
	jgYq4XSDCU7JBSXwtG8/uSodwCSyhspTQIqy+kBvlqg/W7yoHDUKTHoHjGS4q3ENdZwtbVt8hi4
	D+DDENh4YJBLqUbURcC35wg==
X-Received: by 2002:a05:622a:15d4:b0:4b2:d8e5:b6e3 with SMTP id d75a77b69052e-4b313dfd74dmr139717871cf.1.1756891553760;
        Wed, 03 Sep 2025 02:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtzVlVNKODIar3OKV1Dpdt4jlT/5/HUDsUa/mjebH6AoF7OB+QsQV0PuV0R4ZhtiSsPcI5mg==
X-Received: by 2002:a05:622a:15d4:b0:4b2:d8e5:b6e3 with SMTP id d75a77b69052e-4b313dfd74dmr139717631cf.1.1756891553148;
        Wed, 03 Sep 2025 02:25:53 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046af12536sm102654566b.100.2025.09.03.02.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 02:25:52 -0700 (PDT)
Message-ID: <b7a1b89b-54dd-4d02-afcd-0144df5a6d57@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 11:25:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/adreno: Add a modparam to skip GPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek
 <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-3-f3ec9baed513@oss.qualcomm.com>
 <a701e4f9-57b7-46cc-b42f-f1a4a902fbbb@oss.qualcomm.com>
 <zmaphb3douzah5m447naluu7cjrwieb36uznjb7uamblxduira@xhtklqmy22tu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <zmaphb3douzah5m447naluu7cjrwieb36uznjb7uamblxduira@xhtklqmy22tu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SX8OZlPzvR0ee5mJU1olFNyMtFfwVhaw
X-Proofpoint-ORIG-GUID: SX8OZlPzvR0ee5mJU1olFNyMtFfwVhaw
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b809a3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=q_ebNChVWJ_O0X_IP0EA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX3UmH3r9E04IO
 IbdDp9iAvyWItNYyFD913SMuiHFh96Gsu6sPF5UG6i/w2GU9lO73oKahkseZp8mbhTvDyZBs4tP
 QXIj+q6qxh46BbQMmqGAM8fj6mBGTBCrKZAX1gYacRFXAfQL8moc/s1eFAjxateQLqprRl3Qxui
 HoCrzCGOb/A8H4+MOShxkQo8GS1MPBC7pK7GwDIL/d5gi9SEzDS/pB+G3TdxOPV9/vStA2G2h3k
 MPWcFSsOeJMfUP/TrwIjGjQNIE4MiTRbNzycR5oUcQF+88oJt9cb9C04hhcchPG2TgLGJrAoher
 UbLTCcc37goWdQRdHMpjqH0qOryBjymBaig/plbnLbcqVPt5sEHf/k++E7ztZ1VyKes3iPamMZN
 ZIc71MoS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On 9/2/25 3:02 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 02, 2025 at 02:30:48PM +0200, Konrad Dybcio wrote:
>> On 9/2/25 1:50 PM, Akhil P Oommen wrote:
>>> During bringup of a new GPU support, it is convenient to have knob to
>>> quickly disable GPU, but keep the display support. This helps to
>>> fallback to 'kms_swrast' in case of bootup issues due to GPU. Add a
>>> modparam to support this.
>>
>> I'm not entirely opposed, but slapping a // in front of the compatible
>> in the dt works just as well
> 
> Which requires rebuilding and reprovisioning

Fair

Konrad

