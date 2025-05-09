Return-Path: <linux-arm-msm+bounces-57423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A3FAB1279
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 13:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB5963AF950
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 11:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F7622AE48;
	Fri,  9 May 2025 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IIK6uLAU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7805878F34;
	Fri,  9 May 2025 11:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746791391; cv=none; b=SNPcNjYeZaY3Gy8aPboZxSXDd215pW1IXYSMMqvdTo0X4QGXVDg0xQAlyLUWDtvyy4GnZp1LaXEuda31aDsDPI4FKFevYenu5fKSjqt/KR6nyHwEZRgvGqFQeJqrOd/9reOT9wTvXRc2iY+exFljLaxpmRB7F2pHMkYHTMrUfN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746791391; c=relaxed/simple;
	bh=LzA23owCl/gLCp+nsdd04SMLeGsi6TsTQ7PdTfr73kM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cUe0nQ/W3denzAoluBy/eGRPpRJOqSImzZCDjEcR6Ri8QjIRHJI2iTNH4DsgK7rJ59RQhsnN+fm972QzkmspEiPdMPiMF0uOycZH//2xqPO+eZ8CSow3RuQPsln3aTHWYs3wHfWr5uo8nYI4M2qZIKWuUCGPl9Z5GEUwt+PNDB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IIK6uLAU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5493oZ2W025020;
	Fri, 9 May 2025 11:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ci3sr02skDu+fz21dgRxpuqvsMKPsA4s4hZNq9rv3x4=; b=IIK6uLAUXPVvw4Mr
	XXANqvW0OFxGq2JEroUy+KkdaTPxiOKqn7cy7CQixr/qvmYOqNlUHmy+pvCAWDmA
	lXhWo2ztzouj/lZERB6++piHsCBQxrd4idNaKsDdhKiB3fKTYyqb2XA0fWF5lmNv
	xKsHoQwhJPhJtr6tW0/4OENlheLz8Lgj6SA8WDPF0ubm5nR66YkEzMHB/ylEQ0N4
	0bVdYqL0eeNQLRSWBTEPOyk2KC5qo0nAvVjDq5pt9xPxf8Sk/FzNM3phw/L3prz7
	KTHGXMM9Ly2rMxXGWNfifUWMKQShjXy6+2PwOebqTdFwzfSoz9CX82tYrCa/ULi2
	1cYgNA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp14kxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 11:49:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 549BnQZj008105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 11:49:26 GMT
Received: from [10.216.32.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 May 2025
 04:49:20 -0700
Message-ID: <be69cd1e-c04c-4976-9be1-390631316d3f@quicinc.com>
Date: Fri, 9 May 2025 17:19:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 10/11] scsi: ufs: qcom : Introduce phy_power_on/off
 wrapper function
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <bvanassche@acm.org>, <andersson@kernel.org>,
        <neil.armstrong@linaro.org>
CC: <quic_rdwivedi@quicinc.com>, <quic_cang@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
 <20250503162440.2954-11-quic_nitirawa@quicinc.com>
 <58d913b8-0715-41b0-883a-423f29cb5a8c@oss.qualcomm.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <58d913b8-0715-41b0-883a-423f29cb5a8c@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDExNCBTYWx0ZWRfX9/mdN+QE6sga
 XEGTKXLXL+RNHewJvnuz8QuRTIm6Db0N3vjMZq1luej2RBe7fTqJTY5yntcsmdgujAhTvJC1rMy
 rlPHj9pn2FszkGvusWUF7t/NBgZXT/BmuV+dTDfnp7v/3FSK73eK38TnQ4XCeRhth93GBLhsNiL
 KflQOh5+moN2iQ3UxXiqLRY/H7xpv3bdDVzreJMpvOTUHuGXn2qGQR975LkO+yPlJzMPEA+27Yr
 dmkr9bOAADWAW74Vxkm5J2sH9OwV8l37jWcx0AH0RkGfG/OgwWGlIuGFPaqwnXgTjHeLFitnclq
 13oCoNd1fnbjXkNwADfX/mwZfvMkcwNa4pNBUYeIPJ9tbnyMqFxjukJzuD1aFA8oKYyWI6tQpMU
 /UuLzzH6qygnTF6qU8BJZV8ZXfF10oeqh9jqdFXrgV4aOUm+2LdpkmCmsKOW6An0nXoJGZX+
X-Proofpoint-GUID: BV_vMBhyeXkfyLkOd8T8YgUQmo0151il
X-Proofpoint-ORIG-GUID: BV_vMBhyeXkfyLkOd8T8YgUQmo0151il
X-Authority-Analysis: v=2.4 cv=W4o4VQWk c=1 sm=1 tr=0 ts=681debc7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=ih6f6iITNb5_DMHZzIMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=712 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090114



On 5/9/2025 5:07 PM, Konrad Dybcio wrote:
> On 5/3/25 6:24 PM, Nitin Rawat wrote:
>> Introduce ufs_qcom_phy_power_on and ufs_qcom_phy_power_off wrapper
>> functions with mutex protection to ensure safe usage of is_phy_pwr_on
>> and prevent possible race conditions.
>>
>> Co-developed-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> ---
> 
> The PHY framework does the same thing internally already, this seems
> unnecessary

Hi Konrad,

Thanks for the review. There are scenarios where ufshcd_link_startup() 
can call ufshcd_vops_link_startup_notify() multiple times during 
retries. This leads to the PHY reference count increasing continuously, 
preventing proper re-initialization of the PHY.

Recently, this issue was addressed with patch 7bac65687510 ("scsi: ufs:
qcom: Power off the PHY if it was already powered on in 
ufs_qcom_power_up_sequence()"). However, I still want to maintain a 
reference count (ref_cnt) to safeguard against similar conditions in the 
code. Additionally, this approach helps avoid unnecessary phy_power_on 
and phy_power_off calls. Please let me know your thoughts.

Regards,
Nitin


> 
> Konrad


