Return-Path: <linux-arm-msm+bounces-77866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C26B4BECC81
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 11:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7B7E624816
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 09:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00242957C2;
	Sat, 18 Oct 2025 09:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IlqmmEAC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B715288C2B
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 09:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760779585; cv=none; b=NzVxXwJc8ICI8xw+mcsfGEKQk1nNljenafPxAAS7aXFBgqCEComdTzTVgNpuUr+BPo580HofLvEGgBmhtLy5GmvOUDbMOmkECpkb9G7TijykCVr63TuwijsILZqYOvyERESEmYmub3mZm4ib7OcFnMd3kgPt+oTO9V51s/0qo5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760779585; c=relaxed/simple;
	bh=wMpDMGFQKHxy/NBZclNn31ED1l+VBENotPXsGz0x/mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KFx4v27KK4qcUdgkA91ULrShafkSeBEdYUhZ+OQI4pZmUprJcT9Ob/xypXIm06bOiWe7FRrrmUCKrZkzcd4Bu+LlLuyjI/2yEYQGXypUd+BYLyvG+9ecnnpY5xPfIc4LVFS31XaJshlohq2ULjETaI6hh2TMuCVCcPsvJy1ivvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IlqmmEAC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59I7xnW9027965
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 09:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6xho3cRc1k8Fcl9SOaVvv0V5Pp02f2XuzfHvj1N+8zA=; b=IlqmmEAC+79o/PR4
	t33mL4xh7Qw9kJJcWFCUT+VrkxA12XFKRHeomVcfTRjgPIj3IUsTzD8nm8Br/26M
	gzr3eXL6hW2XCDkg8mL+wtT9V0wyduhVb/Vsl26DGwH4e+bug0GsbL4/O+yYf3Oz
	11rs9bJ3uC5zF7XRzALOnWdntxeeO/ioj3UQyOeccwtayaZhLMUlRyhV4X7WMpjv
	IPSaAJHU0HkG8mrq+QnAENtamqsgLHpI5yYUTxaJ1mMZGJlyvQsnDMU02nBLOm+Z
	ltBM/O9IFekUSDJyNHcP9UPJQ4K05wf+HrxvwVsCCOb0QIfp5HtLfBslRYp8DSQn
	IiLRWg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2yv0fay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 09:26:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b551338c2c9so1719006a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 02:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760779581; x=1761384381;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6xho3cRc1k8Fcl9SOaVvv0V5Pp02f2XuzfHvj1N+8zA=;
        b=nCvJcMSpo7k7F8jEIZslMpHmkZFLGucgchmxoLAxrGJZAhlqZTJnMUxeP6ZecA/QHH
         fgLm+G5z43JghZtEJuyKJDyGcsg3LIWr8gUfW9m5bcJuCrL55lljY0WVmGYEgd1ENoyG
         0nAcamf/Y6MgQ7zK7UteJKLlM3Kbsn1ILYfSkXPYvl3lyDDZEMLD7fQZxw2uY4zF8Gjr
         zAMoSt8t+S1LuFNFkSLeqnwz+qq+IEVzYR3JIGO9KhXJc5QJZlqVlzjed2gLAZDfNneV
         tA0ZS8U4mPMhjwqom97NmRtTk+Tkp13PYogsa6P7aUday5uDbxMmBsuEp8gxIDfE3jKN
         yURA==
X-Forwarded-Encrypted: i=1; AJvYcCW/kv+K3+SZLvmCY+iTbl2BvuTZQ4/tyfWcBbxwh+I0IAZ+GQsxud44f58jS1Au1iWNsQA9nJ2nCijijBYp@vger.kernel.org
X-Gm-Message-State: AOJu0YwbvzqyIBulW1jsdp2DINyfDVAMDjNZpM7cj/vBnD/U8qLCc5ky
	hp3mLifUn8Q8BFB9mJsbzy5o4zURNwfcn8x0vAZNufM8HSkPx+MGu0UFkpJFeBrIYL4omnZGof/
	Wvp8G3iL0sJIYtg03gpQAGlr7k49CenJcS17vSA5ivVYjFs61V4zdhMlI/OXuQ/GCv629
X-Gm-Gg: ASbGncv3qYJwPBH767WCG/ozXEEbi6V002UroUTHq91E9R7ilHpF3qJsfAmvJRnPIyn
	kecu+UVPMYSlWOhXW4XUNolQTb4KMIk2TmYDyeIysPTzXtTTgG9VDmy0z3hNeCLr86leAM+tpNm
	hXJlHXi34q6eun+0oxxoM6aQLSTR9Tly5Wy3msIEAwZGV/xXZ3C+r4yQVDembzh0LErrQtOCoXx
	RKlVxH4i78sA0WODWBKAOqgXWANUj6XhgMnDu4zxLC51GswxlBIlA7rl3dD3kw3n+UX//AsyrYx
	t/Mx6DElAXKNyHHLe7/N3GKQyRR8t0oY8OwD4DozBwwV19d+upXEDjy77HmXhHjPg8ljuXVBNXz
	gX55ZxXPEwvTgSHV7E/uO9655YVTCt97aDEc=
X-Received: by 2002:a17:90b:3f10:b0:330:84dc:d11b with SMTP id 98e67ed59e1d1-33bcf8e4e19mr8048563a91.18.1760779581485;
        Sat, 18 Oct 2025 02:26:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEmESriWFcZzGmtgits2npnFUdruZMy0sc09C2Q2PskZmtfwvW+rj7fVvru8J0S883ilZfAg==
X-Received: by 2002:a17:90b:3f10:b0:330:84dc:d11b with SMTP id 98e67ed59e1d1-33bcf8e4e19mr8048549a91.18.1760779581053;
        Sat, 18 Oct 2025 02:26:21 -0700 (PDT)
Received: from [192.168.29.113] ([49.43.226.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5df9351fsm1952642a91.16.2025.10.18.02.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Oct 2025 02:26:20 -0700 (PDT)
Message-ID: <26537629-ec3f-42c5-a1d9-ae0a8566c871@oss.qualcomm.com>
Date: Sat, 18 Oct 2025 14:56:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] PCI: dwc: Fix ECAM enablement when used with vendor
 drivers
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Ron Economos <re@w6rz.net>
References: <20251017215817.GA1047160@bhelgaas>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20251017215817.GA1047160@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UjLj0FOozRV6306Kv_-Fwm_jGUwhHf13
X-Proofpoint-GUID: UjLj0FOozRV6306Kv_-Fwm_jGUwhHf13
X-Authority-Analysis: v=2.4 cv=f+5FxeyM c=1 sm=1 tr=0 ts=68f35d3e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=r8OtbAjNO6w9l/f+plF4pQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DmEVpG1DHoo6bZaV9IIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX9y68KfDpPx3M
 qgdDr+Vr9AQ1FKXiq3NVIaGGiivXLIMaTtMXQZqgpHO+GVCGZwsWY53haP1az3SlKFTKdQMvs7P
 LFCL6iBMjDc9yvKXBngXk9RrufK2iyKCq/TTUpzGiiPu4XWvE+rdMWw1t2MhseSjtj5uRGEQ3Mr
 TCWZS53xhbPbROgzHrfq5wgWJNUH8c8P9sdF0pbJY4WxDBcRWeUVYAYNGrT+G4lfh/9ubLS3cxB
 fEycXHGhEna95kjEPoxu0X8/T8fwBUsrUeajw3264UdE6OnSVTe1nRPcq0pu7N0bYK162pWoTl3
 zqZ9GskhCbnUxkaqEjh9mrvwqUDCUUZyJo/wdPH2h76NADmn4a0oMOrHxGMRhxIWighnVVLbwt2
 jGLMKASatlfqaITHFTBCbjp6blolaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-18_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180023



On 10/18/2025 3:28 AM, Bjorn Helgaas wrote:
> On Fri, Oct 17, 2025 at 05:10:52PM +0530, Krishna Chaitanya Chundru wrote:
>> This series addresses issues with ECAM enablement in the DesignWare PCIe
>> host controller when used with vendor drivers that rely on the DBI base
>> for internal accesses.
>>
>> The first patch fixes the ECAM logic by introducing a custom PCI ops
>> implementation that avoids overwriting the DBI base, ensuring compatibility
>> with vendor drivers that expect a stable DBI address.
>>
>> The second patch reverts Qualcomm-specific ECAM preparation logic that
>> is no longer needed due to the updated design.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>> Krishna Chaitanya Chundru (2):
>>        PCI: dwc: Fix ECAM enablement when used with vendor drivers
>>        PCI: dwc: qcom: Revert "PCI: qcom: Prepare for the DWC ECAM enablement"
>>
>>   drivers/pci/controller/dwc/pcie-designware-host.c | 28 ++++++++--
>>   drivers/pci/controller/dwc/pcie-qcom.c            | 68 -----------------------
>>   2 files changed, 24 insertions(+), 72 deletions(-)
>> ---
>> base-commit: 9b332cece987ee1790b2ed4c989e28162fa47860
>> change-id: 20251015-ecam_fix-641d1d5ed71d
> 
> I hope we can remove the assumption that the root bus is bus 0, but in
Yes we can remove this assumption.
> the meantime I added these to pci/for-linus so we can build and test
> them.
> 
> They're after the pci-v6.18-fixes-2 tag I just asked Linus to pull, so
> they won't be in v6.18-rc2, but should make it for -rc3.
> 
Thanks Bjorn.

- Krishna Chaitanya.
> Bjorn

