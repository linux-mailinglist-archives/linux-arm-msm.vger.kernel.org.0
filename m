Return-Path: <linux-arm-msm+bounces-76253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E646BC2327
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 18:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 948054E2991
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 16:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68CEAD4B;
	Tue,  7 Oct 2025 16:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="efOu44gM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719F91DFD9A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759856024; cv=none; b=pm5RZ3WsjP9xhFVgArJKcSgi3PuJ+a1oxtuatuZa/tph9eNGN6e+XgHD7LrlnlgpAvEwl7VBZbLqb5eW3zebUe2Kc/tIH9YnfvH7zdcHAPZHbCNWmNOmhU8AYOz2A7IxIv9zoN6zGHHCPv82LkhDeEfMjTy8cubNaylMdpH2FyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759856024; c=relaxed/simple;
	bh=gB1jJIExV2pAbOeaDe4AYRBkzTchnt/cZZ+ZnS3M2NY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a32dABTEdexxxrawpDbKwcxlViZ8xOcIjuMgqEgr6OqZLoNT2LNGpOgFM3nhfdMtbVaaIepfS7VLEzgk6t8066sJ8gLglYI3QryVMEVzbpHK267evan/dBsFbH71YUCWWdAW4fjggtciSC4sY0KMV4hzzJBZ8PXSgy25Drf/asw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=efOu44gM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET56O000438
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 16:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQtZdEHBsUHjjpKVaL7JSL00ET6bJeqQ3HvFIqWIaPU=; b=efOu44gMlNAbBcNO
	HdlrmI94twT324C+M8P6Dy61rbvPN4o4seMUvhvkm89/vb/xPwMNcaEb4K02Ykf2
	FwJvg1RvgdVaSavYmHCGv0D1dc47cpMlnfxFeBeahbdox2U+94rR1lyFTjUv/2VC
	c/2e0eDseo3CHT5pTvPGxQNPlQ9GhpitnaCUtb60GDdgzX3v2TNGpTmp55UpxZ4O
	CqK/EGuyadySWAaN8RBLd5SCGzBWSaHkD3Tu165AO+fO7ajrCo44i5iDN4/an1Zd
	Um7hU3/BQc4/ZxY6ylR1jC2w4uB9wDWsFiJCpc+nvnoGXFI3OGCaSa6D0+dpcg+M
	lhMZbQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgr0yw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 16:53:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-78108268ea3so52784b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 09:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759856021; x=1760460821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lQtZdEHBsUHjjpKVaL7JSL00ET6bJeqQ3HvFIqWIaPU=;
        b=l4d6pXuvkDiaicjJ0bKQr+RKlp0I7N2cCgARC0/szX7iD/N48rhdSKyhI6iVmCuSEq
         CG3LDYvyZGiqvggeV7cDti7vBuG3HXlV7fcDjgIGULaVWT7+scWGUMs01gke83SE9GGo
         6wLnUOe9xDpfTS6Erg+asOUJ/W2KUsKnUPMQq+uRSlF4c9rMiouSI1V4lJ9d8BM+nnI/
         Xe/05O8qkf8a/uN+u51N8iWbcXSW78Jm6/okpcqmQxg5etI+y7rj5dAajaayNG3XWS8U
         Rn4OqBYqO6A3FviIqqQKZGRYc7cJxCclbhSpoUuMh2+UCoNsrgPdNv9lf9krhv7u4Gdo
         4idg==
X-Forwarded-Encrypted: i=1; AJvYcCVJSMy3O21c5Oub2DLJrQtVB+wbUrv7w3xnlhubTs+fGHECJ7R3MHrnr5dmht6qZLKYa5ColdkKHsma9lhb@vger.kernel.org
X-Gm-Message-State: AOJu0YwsbXzIMRir2+msfwQkfQufx+1z3w+Qn4Ng/8nCzinJTekKJqL9
	OnhuMmLenrbN+D64ZsXLC0CWNs9DkI/0e1Lsgmc6sMGqVsmj4RUyLHVoQTZCPxx/h24Yt4eEWqE
	EYkh7DbccdpHM04Umsr/PK0l9Slfpkcj8281wYbXpT1WY6F98u+46/ci1QO6K+PD7f7DC
X-Gm-Gg: ASbGncuBqmSSVUF2iojoXdSWnGV6muH5/QolmLR/urCxf+NuHpcTIcON2l/1qSVOQx8
	HSYiZPEkfC45bH1fytq3t/bag/LR4Jp/IuMUkfm5oWCAqVNySYDsBijoMa1i7VrfVDZJQGgUkbk
	UCK0RtD1DIKWFe3Qk2sI2L2KQ5sissJ3Y+j1h2GFgkopG1qWmK94SP+D8AV36qOTDWF6iRRiaqe
	faVWhpIs3U2qZIQyQU48yt1xpeFH2Gb76dUK4BqzIzR0u4sl+gtPcxwHfpox+0CEER55kWbD8bv
	7wBQhBRLWfqQ9lBSjdaIQy7Vns5P37VJRjZK2EFIpVALWtQ4uirmf/CI/Irw7fA+OJKTpJi0nFS
	86IFmmxiqgOHrT9f55DI=
X-Received: by 2002:a05:6a20:7f88:b0:2c5:6682:d9a with SMTP id adf61e73a8af0-32d96ec2adamr6224586637.28.1759856021216;
        Tue, 07 Oct 2025 09:53:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHreoUx5tNEMY2AIWGEaQAkLa2qLKH7Ia0NtRGWNHj/vLjQvX6NBvA9SPEtJ55nDTnxYWNTvg==
X-Received: by 2002:a05:6a20:7f88:b0:2c5:6682:d9a with SMTP id adf61e73a8af0-32d96ec2adamr6224556637.28.1759856020713;
        Tue, 07 Oct 2025 09:53:40 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b62e3508744sm12099840a12.30.2025.10.07.09.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 09:53:40 -0700 (PDT)
Message-ID: <f185979d-029f-413d-9e49-b6b3237b19bf@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 10:53:38 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Remove redundant retry_count = 0 statement
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007161148.422744-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007161148.422744-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX90fXWfCR1sjA
 Lhfvdy41z+pq+dZFRYekNosr7OgE40Ee4memWg/+yonHtP9DfZgGOrB7GE4ceR44zmEl6dLsxYz
 Xc6S2a2QB07EBIfzIxwV7JCOpUiaN/sEHA/0h71BP1HzudH6U3/WxPJaF+fQvOwqWY49n5Q3IQm
 mShB2J2zb24eFLIeLY/q+IVMPISIgcGj7hrA+5GIDKDCXQ272QFRYuZNvtlGHdgnOTJtK52troz
 3RXGxAsooGpbdTfxdhGoyAzQzjHFR3KzcLFRYOlbfdZIGIZLoLrnvDzXm9gz4hk2FoP7kdVRSJN
 HqwVU7616Os6CxCYE8fTn20NtIIoZ8wnl8KAzrBTCkUvITz3BADvQG1bXwWnjk3GXzUOjonvDjU
 QEVuBMGLP+ph2MtqzGE/TSqcO7b8Dw==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e54596 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=mnYluDPEoM_Hn9eIMYsA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: iyfi7RP-Wy5UEMRd_1-d3_xqIHTpf94J
X-Proofpoint-ORIG-GUID: iyfi7RP-Wy5UEMRd_1-d3_xqIHTpf94J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

On 10/7/2025 10:11 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> If msg_xfer() is called and the channel ring does not have enough room
> to accommodate the whole message, the function sleeps and tries again.
> It uses retry_count to keep track of the number of retrials done. This
> variable is not used after the space check succeeds. So, remove the
> retry_count = 0 statement used later in the function.
> 
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

