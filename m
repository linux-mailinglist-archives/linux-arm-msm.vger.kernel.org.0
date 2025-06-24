Return-Path: <linux-arm-msm+bounces-62214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E70BAE65E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 15:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D50E64C3628
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 13:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B507D2BFC74;
	Tue, 24 Jun 2025 13:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6t4sxbl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B21B2BEC5F
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750770262; cv=none; b=LC9q6+3H8JmtmL+U2ju7jDBYubQrlYPNQ/A0r6cAIEdW0SwF7GENvGhN1Lh+2jGscYSrZFmzkg4+KoiQEytPgT5149c/pMXcqpMn358KHzsygrqH1aOSCJen5kZ2GRZL3y82x3UV6ZWszqk+dR6l558M7yeT2ASzJslHfiWa3JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750770262; c=relaxed/simple;
	bh=MQKowZ3zRpM28etUCfcetudpyb05NjBVDfvr3BSFbxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bkspDt9b8jsobj+VbOjvJNmLvGVJzO1qngmPkVKbZol/OP/k+Con1ftHy2Ediic5LldvR5BLUNQ83cUAIip+Kfxm/fVQXFIFnzMkULTi2fW45+03x7cnCQvTH7fqWgFJbvnDSIfESm7vCw/XqdSSJFCpQ+PQBPOquOCvyoOu53o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6t4sxbl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OCGaZQ004334
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/495hC0vUVuxQ++cW8y15Nw00kbXFjpRqZMO89lgJs=; b=U6t4sxblEbxZw/wO
	VG0uUjXknWQQqGCpI9mmEwKPWr3FXrpXOHnxHx0PX6ANP6B+CO+UHiniqrRusYma
	8J0IuPqxRlbLIaAmHJIoB3d/kxb2Uj1VCLfjYMuq0N1clpEOYK/H3i4ijHJqhlRN
	ZhYWJx/RXMKPONXftVcuaO4zircF10rUqLDgm0KnnMbjzHSuNzDpRIXCN8th5wBy
	1+ybZaTQY41tBIoGQ2HhOtQe1CSPqWaSWRZyVsmvLCM9vri6FwSFB2+bRs1IWKrX
	sR5/IwPDLENbpNrNQEd1+I9rBgN6Ouk66Et45hqW9ejz9cDLXHrwu6Hy8juVXrdE
	lPtXsg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3v25u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:04:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2365ab89b52so3460755ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750770259; x=1751375059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O/495hC0vUVuxQ++cW8y15Nw00kbXFjpRqZMO89lgJs=;
        b=SvKbNT1hrCDVqPmm+Ek0iUYv/2KE1yjRFFWkxZJMgWR6tcPcn5n8N9uCDj8cukQbdv
         tirWWYXH100ad2U2Wt8EJlKBkwns3tNJalLGFTOYNSnkOGXyZRKV/8SmjbYtSX3WGBO1
         w58GhMxz7SDQoRkLOvU9B9AHaBzeT5i4IjB6rzzS82FrAlQP1NFDFwm6ZJjF3m/7miCJ
         9HsJ3xH3PaVAo4OoFr0Gq5u3DXZ5A/k2CgQKLANkZtiLmuQBBFrZg1RkbZ4epRtbgKHg
         byeQsx7BbLl0WPOjzdi/Lh699gnafXKi5NAyg9hjeKbbrDgwj4Oo6W63Yzc2oK9wYkQ8
         OtYA==
X-Forwarded-Encrypted: i=1; AJvYcCXVa7ssxpetA/za12Pk6RCxQohxGzlrx+MjhHtFFlpXgR5b9v21YNHZQOEIcNdxbt+ZMgO3MBwPnljc+Lwh@vger.kernel.org
X-Gm-Message-State: AOJu0YzOYUUvXpz77aHPeljSEoYqbhsLIbjr6cZKtzCnJWpiTXehGZkY
	JAesRdG/dzusKDZoO5jm6OF1vi2MTsk7oa41jPY5RKKL+22iEpBB0qAVUZrG0fzCfOG0lKmAXKN
	tU70B7AZf77oICYWTbGtjd+GCKzH8ifIP352SJfqXcTNWEmZbJrBiFoZtmKjHsA9ndCZh
X-Gm-Gg: ASbGncvvj6mk39d6lsWTLux2Jzi3C08gk33bziABaYWIgkOoombds58sorL4bE5nuTD
	YM0D65GB6NeiK7YFD6+6YHLNmw7T7HhQxLVT15/YZbNCzLAdZLk1sYI8RMQjxssBEScwkCtMrgp
	pe8UD7Damk0sIKCQLPlIzzweu8ogtcFyrckdsebYkPfMBNHuuIel1zGopP1kVnPVoDt9F4Au8P1
	R/wdE5jjLKK+y7kLuoL1SNha684GZexB8iFkB7atD8voQFJE+nLqbrPy8+ei+KpnfeEDm1lbC80
	1M0e5Y5q/7PuIJclxOsBwI2OGMonNLqfg0ytUdm/iuHwUk4H/Hx83J1ydA==
X-Received: by 2002:a17:903:8cc:b0:234:8f5d:e3c0 with SMTP id d9443c01a7336-237d9767a10mr202186065ad.6.1750770259252;
        Tue, 24 Jun 2025 06:04:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9tPnXoLF91QSG183P4Nqg3xkGhJKkNxAVBtQTPbRr76iNpa84omAzPiPt/Ao9F7KIQhX8og==
X-Received: by 2002:a17:903:8cc:b0:234:8f5d:e3c0 with SMTP id d9443c01a7336-237d9767a10mr202185245ad.6.1750770258270;
        Tue, 24 Jun 2025 06:04:18 -0700 (PDT)
Received: from [192.168.0.126] ([175.101.107.119])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f1241efbsm10331324a12.36.2025.06.24.06.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:04:17 -0700 (PDT)
Message-ID: <a46b9870-207b-45a1-b3e6-5c13e1857640@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 18:34:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-3-krishna.kurapati@oss.qualcomm.com>
 <20250623233211.aeehndz2nxqovepd@synopsys.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250623233211.aeehndz2nxqovepd@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDExMCBTYWx0ZWRfX3THC1B1g26Mb
 L9Xr0UjdydH8jh1dEqb/2tAcrpPWGBwsHEIOmlmdVbbz9kQH1Exoo2n35TsjlXvKWX3NMbo1+3E
 VkKpgjNNfSb/yR5kTOBb7b0yzisQEhIkLyMDB8nNtmyjadrWDAVvbm+yOj0gS2UQWvYgJTlTzSX
 78iNlOTykLkHKm4p+9AQEtau5NK3qy39B16Uwtf+4kiPwy4lHe41PP1B0Gxj05ThxuLtvQAfzlk
 rIPw0Yo2KMt1NsuLwYGi4nXaCynVov7iN4MOerBSGA4FoXDkO9Z+9t3dgFtb/zJRaKFNT8Tm6MZ
 RHTZsUFHeqgu0eoIPSTkgDuQRL826Wj9y2iQ26i971nBygjKde5kLQx1Zk2LGLD3WQwYIshi++O
 apltdOCYQVIoWw2a6tOF2F4I1Q6hm/rCxMxOxcbIQfwNQsrCC1mWXaRvr7rwkHWfZ8k2DzaO
X-Proofpoint-ORIG-GUID: HSlpsEHt12o7imbpR8ich6o6bBVeh7Kf
X-Proofpoint-GUID: HSlpsEHt12o7imbpR8ich6o6bBVeh7Kf
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685aa254 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=yWXLeC16oIbqf35128AjHQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=z0btSGuGm7FRfGALX-gA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=898 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240110



On 6/24/2025 5:02 AM, Thinh Nguyen wrote:
> On Tue, Jun 10, 2025, Krishna Kurapati wrote:
>> On Qualcomm DWC3 dual-role controllers, the conndone/disconnect events in
>> device mode are generated by controller when software writes to QSCRATCH
>> registers in Qualcomm Glue layer rather than the vbus line being routed to
>> dwc3 core IP for it to recognize and generate these events.
>>
>> UTMI_OTG_VBUS_VALID  bit of QSCRATCH_HS_PHY_CTRL register needs to be set
>> to generate a connection done event and to be cleared for the controller to
>> generate a disconnect event during cable removal. When the disconnect is
>> not generated upon cable removal, the "connected" flag of dwc3 is left
>> marked as "true" and it blocks suspend routines and for that to happen upon
>> cable removal, the cable disconnect notification coming in via set_role
>> call need to be provided to the Qualcomm glue layer as well.
>>
>> Currently, the way DWC3 core and Qualcomm legacy glue driver are designed,
>> there is no mechanism through which the DWC3 core can notify the Qualcomm
>> glue layer of any role changes which it receives via role switch. To
>> register these glue callbacks at probe time, for enabling core to notify
>> glue layer, the legacy Qualcomm driver has no way to find out when the
>> child driver probe was successful since it does not check for the same
>> during of_platform_populate.
>>
>> Hence implement the following glue callbacks for flattened Qualcomm glue
>> driver:
>>
>> 1. set_role: To pass role switching information from drd layer to glue.
>> This information is needed to identify NONE/DEVICE mode switch and modify
>> QSCRATCH to generate connect-done event on device mode entry and disconnect
>> event on cable removal in device mode.
>>
>> 2. run_stop: When booting up in device mode, if autouspend is enabled and
>> userspace doesn't write UDC on boot, controller enters autosuspend. After
>> this, if the userspace writes to UDC in the future, run_stop notifier is
>> required to enable UTMI_OTG_VBUS_VALID of QSCRATCH so that connect done
>> event is generated after run_stop(1) is done to finish enumeration.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   drivers/usb/dwc3/dwc3-qcom.c | 82 ++++++++++++++++++++++++++++++++----
>>   1 file changed, 73 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index ca7e1c02773a..d40b52e2ba01 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -89,6 +89,12 @@ struct dwc3_qcom {
>>   	bool			pm_suspended;
>>   	struct icc_path		*icc_path_ddr;
>>   	struct icc_path		*icc_path_apps;
>> +
>> +	/*
>> +	 * Current role changes via usb_role_switch_set_role callback protected
>> +	 * internally by mutex lock.
>> +	 */
>> +	enum usb_role		current_role;
> 
> Can we just track the current role through dwc3 core instead of an
> addition field in the glue?
> 

Core caches only mode. We need ROLE NONE to identify cable connect. So 
adding that in glue to keep track.

Regards,
Krishna,

