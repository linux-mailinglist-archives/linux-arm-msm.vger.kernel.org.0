Return-Path: <linux-arm-msm+bounces-64422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCCEB007F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 18:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A595B5468DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 16:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168D42EE999;
	Thu, 10 Jul 2025 16:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jN31oc9R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF4F2EE980;
	Thu, 10 Jul 2025 16:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752163262; cv=none; b=SN6/eQgp5TRb6xGb3hqNEAtb4nZp9BUjilmBEXnpkFwe6v6DnPB5QbnI8Pud0EcjSmTb7Lsg0F8oB1rKdW+AW9845JYc6HuKEF4PoiQ1G4+1ygFmtfEpJFly/I1JdUlioT5VK+O/aBj6WStPfhEH93idt7cIvwMDc5OK8e9kvK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752163262; c=relaxed/simple;
	bh=v8ElBDnMClgNepe5mdVK1RbBPo+dvrlzWpM5bJHEYik=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WcE1k7Mw1PToznba5Fl47Z25mgQtsuVkpBKxBjbMmBwZKp2WC8UcgDr3XPtDHkhEIywVuKVZkDA4g0/Q7+UdLOBGkDocqk1XLir2+uZBPzvJCng4g6nmjUEbCOm7dViSnPs2UoH7+w0NkDEUmmOEz3McXICYMZhI+ycr4GBob8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jN31oc9R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ADcTgl022589;
	Thu, 10 Jul 2025 16:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iRZh7WJh0N1Au7LsGB/4Me9YIACj+GKTzoKa+QiWZBU=; b=jN31oc9R7AcH1F9E
	pMHO/Dk371obuGXZ2JH7nbJiwH2DjE092GuhMTo82mHjDoEPFaYrMg3rO0lyZ5uG
	dhHbMNvpIeW9aZsiYTV6GMkjqha6VnYOlhs3uSit6SVnmrvhkH8/h1eVbsySJk2L
	n35UXb/WyHqaOGHRcrncFWEWdZ3pSyvjNoruRIhO7pOa6lc1f4Adu4OrBO/1TN2F
	7aXXUSChEX3YGlZfMDWB+s1olpf3LLOFVRLQFTD0reTIN5qEts2iDLpOzLeNr4Lo
	3jc4xo9DEU1LCNzTijDM9QPdNcdxsq3OgnjFoRl2D/kKFzZs0FJsLhUPWyzUVXCq
	/ZIZng==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47t83u1tre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 16:00:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56AG0h4E007078
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 16:00:43 GMT
Received: from [10.216.28.220] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 10 Jul
 2025 09:00:39 -0700
Message-ID: <9d47157e-955e-4694-b2fe-b0d6a685afef@quicinc.com>
Date: Thu, 10 Jul 2025 21:30:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/3] scsi: ufs: core: Add ufshcd_dme_rmw to modify DME
 attributes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <mani@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <bvanassche@acm.org>, <avri.altman@wdc.com>, <ebiggers@google.com>,
        <neil.armstrong@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, kernel test robot <lkp@intel.com>
References: <20250709205635.3395-1-quic_nitirawa@quicinc.com>
 <20250709205635.3395-3-quic_nitirawa@quicinc.com>
 <cc6e8ae1-d63a-4f90-8752-07251b3bff04@oss.qualcomm.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <cc6e8ae1-d63a-4f90-8752-07251b3bff04@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _LrJlFTzeKxSn6TrRoZvidc8JuC60bA0
X-Authority-Analysis: v=2.4 cv=OotPyz/t c=1 sm=1 tr=0 ts=686fe3ac cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8
 a=STXggq6GYrdehICBV5YA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEzNyBTYWx0ZWRfX4NBtf8Vmzhin
 PoNNx4Y0P/lg0J0vuWKi+u2mr6qh+zWIG1oEyiTjeQzqKhvpcTKBlybPQspRdoLD0965Yq0Gj9j
 TplWOqcUd+vn/TC6ZIOYsliEESySVYmIg6HOtPr9EB6NZMTVHLqBEaqX6zs2fSjkwtAd4QRqpUk
 DgOjJ/YxiOvcuqZgVF9LkvFyLnA5OwBY2u7RzXnYpaK67ebOW9T33OU63Jul7oOqDESWYFPmd5m
 OWy1ZaIfv9vJML2cZlp4nbGGgUpGwWI0U3TencEr/0vg1rwpsK4A6dLoXQ+r7NyMAYOs0BXulV2
 1zWlHO9PFsdEjkoYw+xFDNTlKsHLEUmM4YlGBSUC8KGJVv8AsCN9fHMwhQhWPZE0ph1QkRQfQbo
 ACa9SK0EklDWDe9QzOabPd8wgK1HObjyACwOtV+ExZ8diWOLTCOVYG3hOhQDht3wyz8N+Nxe
X-Proofpoint-GUID: _LrJlFTzeKxSn6TrRoZvidc8JuC60bA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0
 malwarescore=0 mlxlogscore=808 clxscore=1015 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100137



On 7/10/2025 5:56 PM, Konrad Dybcio wrote:
> On 7/9/25 10:56 PM, Nitin Rawat wrote:
>> Introduce `ufshcd_dme_rmw` API to read, modify, and write DME
>> attributes in UFS host controllers using a mask and value.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
> 
> This tag makes sense if your patch is merged into the tree
> but happens to contain a build warning/error. Using it here
> makes it look like the kernel test robot suggested
> introducing this wrapper

sure Konrad. Thanks. I'll update in next patchset.

> 
> Konrad


