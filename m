Return-Path: <linux-arm-msm+bounces-73660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E8AB591EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 11:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E48231896820
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 09:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C89261596;
	Tue, 16 Sep 2025 09:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VBF1AMGG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CDC189
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758014306; cv=none; b=W4KABoUO2Pm1hDKA0bDa7S7eFzSQGPVzb8OpdEKvNFGbp1OX1mgDQAPygmEGUnkY+HPCRLI+AZanzCUgLz24IbcaUyQk+fI25+RvELVwU/U1MX/s43YcsFtgN7cWlvMxTC98ZAhP8JLV76kV0X7+pOCDvSziUvT/j/1LpDIfseY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758014306; c=relaxed/simple;
	bh=zwsqcK1K8I4g/AxL5eYHfhv+amNKbZVGOpz1wTaG/sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H5LDPUaD+mg8A3D+b+lxFrnXMJwDcZcjBIZJowIlsiDkaXj6KO3+BN+PvpWVxwswrpnkF6SGg2ddIP2WWjUuDx89tPKRjZVfWc61SQLd/yyQR17qPAqF3nheupPx+Vp7b5zDfaPNY3BiOmcT1XhnFntRhlw/amiirWa2E/HdQSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VBF1AMGG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3plmX005233
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 09:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5yU38SlnqFnK1dl0OwtvhRawH6vqrbBs2lAUw36iIdE=; b=VBF1AMGG0FRsGwk/
	pu6T9o3wg+JBFYIYurwRbfBzv0GozQATJqDpJ668K1f/FNRpalYYuuhOooOQi7b5
	HHVOE+J7z8FxGOT5DHasut3A6hnjMUbe323x8mht4frVnhYATo+lbSKhdBUzye+4
	rri6KW0Aqb6H8tv/Zwy65NiZomWSwnhTifo84PWC4+wrtnZrm6Pd2fYIEzUAPSk6
	/bgSa0leLh7qK85S3MvqOo9SfCTa8GPlT0Feuaf/EgoMolrlkKRoDOAehlce0Gp1
	arP+S1TFvDAOlyKkE/PCxQTnquF9LyYHQPnsTGLFu5WvM50dgMaRk6MaX79SdXex
	G8PCTg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g5n3xwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 09:18:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-267a5c98d47so18208555ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 02:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758014303; x=1758619103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5yU38SlnqFnK1dl0OwtvhRawH6vqrbBs2lAUw36iIdE=;
        b=CQsoinx4ouVg7zN6QiYZbs23eCRzJcEHcdMDC1IZXMo/2VmadAMnnggSDYDyhYplWN
         8jvOelNSTWO/Q0U+fpHru/phUY27l4H/7tLVSdCt0tarJFUDYOR4z4rIpflmjoWqKiMn
         nrVSw4sxcHC+V5YF1Flcd/+V9zpoxWohGeEMEKSgvxpUo1SakqpvOpO3TvLTy5pvFALH
         KhM3bjDqI/BGvpQrw6BAFHdfomLYpJUtd7wQSlGdOjTC9jCOGriXd3n4xko4BeEH6Dbd
         3iLKN6pYzVe8eC8ICe9r8KMt4t2lW8pQQtJok34I8FPmyqJq1Guqr9CRu3g4oZDLsJ57
         sJNw==
X-Forwarded-Encrypted: i=1; AJvYcCXSPSGukFf785DJuw5KIhOLXktOIfajlgTuRPz1iZc1xZPGACed2RpZtjBo8n3ZBzypBAownJph9LTmRTes@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/qFPCYKxSreJQTmL93WCLP6yCXC1okL8mfDChZVHezIaFSmVG
	FjsTFI46O5Fu9yt7A1wCbJnRSvebniqVAh++OLcPiHVP+j5/ZlbTpT/RdczDWMdsoJURRvCHV5S
	AKF7V82ABINWcp5GLKbw/Q9WCofpjV3/pfzmso1NlTahiKSkreQLv2w3afAp7WR06aZdR
X-Gm-Gg: ASbGncuU7PJkMNB3FfBVx6bJ6x+GKzwnKmrITFzFJ8oF4+RidIEeN/y5TLRD1oNqwwC
	gd0nygUXXYaMmbIpj54QWtD9f44Yf0hoiSa3uLUWWslpn/NlP8nSPk+PiEs6FJOL+2pA2Lg9snB
	Y/sQu5hw865qk12b1KfLa6gG4SIrFCZEsRYPWFrqP7A3z7rYCGC7fBF0gjn9I9aVSiK9fIQjQk4
	FBDiK0axy+I6LeyEr0eUuoTYQJu9VoaemsBipUUXVzJhhV1QixH+P8fkJGhOg4Mltz39n3CaJob
	87kMfuvTJjkHpXom1Y1+tGpBDs8OGHgtV5rbQ5Z4ee8RI5tYWPZgNfKg35FX97CK8/E=
X-Received: by 2002:a17:903:166e:b0:265:44ae:d24 with SMTP id d9443c01a7336-26544ae0f0fmr109025365ad.43.1758014302996;
        Tue, 16 Sep 2025 02:18:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUTp4KmbKb6w4ICddFjxV1wTcHyF4t8EHj7cMp3vuJ2wqlH26j9yp2DgzTArzCXUUfH1i7TA==
X-Received: by 2002:a17:903:166e:b0:265:44ae:d24 with SMTP id d9443c01a7336-26544ae0f0fmr109024895ad.43.1758014302506;
        Tue, 16 Sep 2025 02:18:22 -0700 (PDT)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2663f6337b3sm56192015ad.102.2025.09.16.02.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 02:18:22 -0700 (PDT)
Message-ID: <0b950a45-21e5-4c8d-bc76-1c801b86e2ef@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 14:47:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] bus: mhi: host: mhi_phc: Add support for PHC over MHI
To: Jakub Kicinski <kuba@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, taniya.das@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
References: <20250818-tsc_time_sync-v1-0-2747710693ba@oss.qualcomm.com>
 <20250818-tsc_time_sync-v1-5-2747710693ba@oss.qualcomm.com>
 <20250821180247.29d0f4b3@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250821180247.29d0f4b3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Hn-hREOi6kg8kWBQ3qa4jtunYyZqV09y
X-Proofpoint-ORIG-GUID: Hn-hREOi6kg8kWBQ3qa4jtunYyZqV09y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NyBTYWx0ZWRfX77cEF3at9M4I
 a4LikrOWH6tGhjnsrrPzEoO4Ts+KVNU2KP2JKCt6xdLaisjZ82RPeVCdvnh51fBegPvIOkvN7cI
 7QBjSwZnar0wK6YyRW93OxvrHDVjLOvcx8q1gMDqIcjspnvht1ZS90qg+OZ/F+OSqN4wkf4vVRF
 QH0wtFPE8MsC0HM47oQ27vLH9uWQghQzMrbi+8+zEisotMBGzTTAqQJfa/Wg+cVPgdzlaUWkn9O
 8XdumhXuRvVGskj8tOPSPxJ3LH3h9TGxagcAkPz803/UjJdy74d6Wl/2DM3BMNj+x+k/GSoyVxu
 Swfk9ZTAxIegIn2JhNJ7ZzQOAsmUPSEvRBsQI0BESFG8h4z77MAvH+meI6mBjgdTF/F1QjHPUQ2
 GkTixDGB
X-Authority-Analysis: v=2.4 cv=SaD3duRu c=1 sm=1 tr=0 ts=68c92b60 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=xLYDFgVRoUo0Dj3B0GAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150087



On 8/22/2025 6:32 AM, Jakub Kicinski wrote:
> On Mon, 18 Aug 2025 12:25:50 +0530 Krishna Chaitanya Chundru wrote:
>> This patch introduces the MHI PHC (PTP Hardware Clock) driver, which
>> registers a PTP (Precision Time Protocol) clock and communicates with
>> the MHI core to get the device side timestamps. These timestamps are
>> then exposed to the PTP subsystem, enabling precise time synchronization
>> between the host and the device.
> 
>> +static struct ptp_clock_info qcom_ptp_clock_info = {
>> +	.owner    = THIS_MODULE,
>> +	.gettimex64 =  qcom_ptp_gettimex64,
>> +};
> 
> Yet another device to device clock sync driver. Please see the
> discussion here:
> https://lore.kernel.org/all/20250815113814.5e135318@kernel.org/
> I think we have a consensus within the community that we should 
> stop cramming random clocks into the PTP subsystem.
> 
> Exporting read-only clocks from another processor is not what PTP
> is for.

Hi Jakub,
 
Thank you for the review and for sharing the link to the ongoing discussion.

I understand the concerns about using the PTP subsystem for read-only clocks.
The idea behind this patch was to use a standard interface for syncing time
between the host and device, and also to make use of existing tools like
phc2sys from userspace.
 
I have looked into the on going discussion you pointed, and we’re facing
a similar challenge. Based on internal discussion with the PCIe team, we’ve
confirmed that PCIe PTM isn’t applicable for this hardware use case.
 
That said, since it seems the community prefers not to use PTP for such
requirement, could you please suggest any other way to support this time
sync requirement that would be acceptable upstream?

Appreciate your guidance!
 
Thanks,
Imran

