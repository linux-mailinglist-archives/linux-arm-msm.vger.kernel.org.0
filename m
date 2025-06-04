Return-Path: <linux-arm-msm+bounces-60185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A458EACD8A8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 09:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 226171665DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 07:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C641F78E6;
	Wed,  4 Jun 2025 07:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nEs+0H0B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996331804A;
	Wed,  4 Jun 2025 07:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749022667; cv=none; b=axQYaKWIFUOERUy3+pmQi81Bjwdga624E9Mg0NnxaS0pbzo4bonBu/KoBo4BDqedc/YqlRkW0+DlGKtb1PfA5vQgHen3MchqWPqebFSnry7jc6AZt0TQSfrWsBYaIwCFmh+YkIYntuwUTMCpmkrZr9yoTgVGADiec/lDQe1Zats=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749022667; c=relaxed/simple;
	bh=AeBrh+oy5xsCDpXg0d0Om6EvKGdC7MCU1OdkXqLTmac=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iyqwxpOzwZRY2aF4Zl/yoq/1lZdO8ATRUQ15ogcs42D7j+lMV+SKw8OoQmoHs1N7kKXe60kAef66yoLgnhQvRmDqkLpjzuQp+y+PN/I/PmtRX7EFokn15nfCdx3N0P3HYeee3A+NW/0XuhRg6/d4gfcOs11vdJkISZ646rHH51k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nEs+0H0B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553KjETM000708;
	Wed, 4 Jun 2025 07:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HKX4WDJqubHxp7Yn6Vt7HnreGzdd0WNVbOxinOMb4No=; b=nEs+0H0BGadvCB3Y
	nwwUUy8Nikf5/TJbqAJZg73SYdNIdnhJHB/Z6ob2ilUlV/+uVwBTEAsWL1kwL86/
	VY8R1CB2oNaE1bTFefnhozJN6RyXS3Npiw6N0SX9pLmOcelrtXVi0JEtwAqyfM8F
	cWnmJtnPbp5EQEV8Eq3aQ0ZcsT+cUVYyfXvj7ge+p6ZaW7M08yLLYNf7DFIG9eha
	HOkDm2aG5RXdyKStrfolkC3QT3td2hLWv12+otsdFlVEm++AEY+9iKVXGlFEb8XL
	famucgZiKfZLctkAM/CXotXWrUlhwXm/MjaNe90EnvsVkP45LCgBgcIdkI3NpYOB
	BWPQHA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8q5845-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 07:37:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5547bND3005620
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Jun 2025 07:37:23 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Jun 2025
 00:37:18 -0700
Message-ID: <c2b9dfbf-9163-4df5-bd0d-25c5bb43cfb5@quicinc.com>
Date: Wed, 4 Jun 2025 13:07:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 00/10] Refactor ufs phy powerup sequence
To: "Martin K. Petersen" <martin.petersen@oracle.com>,
        Vinod Koul
	<vkoul@kernel.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>,
        <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@HansenPartnership.com>, <bvanassche@acm.org>,
        <andersson@kernel.org>, <neil.armstrong@linaro.org>,
        <konrad.dybcio@oss.qualcomm.com>, <dmitry.baryshkov@oss.qualcomm.com>,
        <quic_rdwivedi@quicinc.com>, <quic_cang@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>
References: <20250526153821.7918-1-quic_nitirawa@quicinc.com>
 <yq1a56xiir9.fsf@ca-mkp.ca.oracle.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <yq1a56xiir9.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: R5W1pYtVDuT2Wkt5a18owf9FwqP_-su4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2MCBTYWx0ZWRfX4U4OUDfnd8XZ
 3DQ/sN3MXN9sqoZJUV8eCj2ylWg75+1Pr48k/Ub8YO4CV5Jksalhm+EOCOqeKvl2Gm9tl7qID2W
 yOA/LmeAlpjEIG+XJ0ld0jMERkKIxMXDuZQlWKuVBx9KFEdXlFsOkbwuC0XT5e8/Ob8yQ9s+jQL
 hOuQbgBKAHXS0vWgiOLia9GGansxi6xFzXQP/MAQFvvVG3RdFu6MlQKKbGId2iyMZtEs6rDXYg9
 BuXY9Dy9NvO1C47FbjwNK/htNWW674BnASV39D5AgMcLR9cONcpPKp8YH2VnXRvmXniFfD6Lxzl
 7cd6sP/gxdy289aGgTCvk5S4JsdMNVNSdgNOE5DWPUyJmtbkmW3rBrHxvdYR7v8EyqZoOlMAuLj
 g3wrposRtic3jZYSghOTjwGdK7vnKkgRH9m9dnPWDepnjjSO/Xt4kJ/0563l8NvpfWgpDyq6
X-Proofpoint-ORIG-GUID: R5W1pYtVDuT2Wkt5a18owf9FwqP_-su4
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=683ff7b4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=MvDHQgU3c1KqSIzCRgcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040060



On 5/28/2025 7:45 AM, Martin K. Petersen wrote:
> 
> Nitin,
> 
>>        Patch 1 is a fix for existing issues, which doesn't have any
>>        dependencies on any other changes.

Hi Martin and Vinod,

For the remaining patches (Patch 2 - Patch 10), since Patch 2 (SCSI 
Patch) depends on PHY patches, can these patches be merged through the 
PHY tree?

Regards,
Nitin




> 
> Applied patch 1 to 6.16/scsi-staging, thanks!
> 


