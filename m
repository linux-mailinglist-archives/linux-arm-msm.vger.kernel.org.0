Return-Path: <linux-arm-msm+bounces-67267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 565D6B175C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 19:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A77B580535
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 17:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB68264615;
	Thu, 31 Jul 2025 17:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HW6b4fRA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DC124DCF8
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 17:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753983819; cv=none; b=n5JR44vg4E/j9OVu5uRFpibuw2tOpgdN7a46uIBQ2sI39Olx90ASkvb1G8HTCWVUWZ96g78x9tp17S9hOLPM4kVNDsT2lyTAWNAhTewV6UTYT0u9mLYJEPsTqtOBnv6CZts2ar8/WVLKIlT9Monupvn8cum7QjL8yVVDwLnBEiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753983819; c=relaxed/simple;
	bh=gF/Lfov/BGotqFyFDG+Y7IiqHn/X1SmvmbjPZQA1YBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGHHWzauJkRiTNSUFgpzCmKn/EB8QRHGXFRrViGN7+xWjpa25a+U7p3SPYZoB+uKx+Q7G6uQmU2jEkx/cKIMJD/38QjplDTSACmIlr7+ApULpl7g7JdxZEAbnWsmH4eYUf7KfjP7wbnirnpjhDO1RM2eloMMV0kF+HbdJzo57y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HW6b4fRA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56VDfXtx019100
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 17:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XgQLj33jhp7/creFx0MYZQCfK0nDYyjfst1wTym5RW4=; b=HW6b4fRAnBY7ty2S
	X4MA4g42Md+jfRahHHBZ88RIglcBUzDoEwehI/32C0VBdPJGVAc0KZh9ZCkEPOd2
	7BtgraezHj17WtQ6JkJPp887JBa+E+PQonkuOtcpHvHOrZSH7L0+NVs4yMmi8747
	+lXSGpnnu4MYDR9EL7FsqwS59X+cY69tx+vPJJzX/pzEbXo1U25Rvy6u4eX+guIz
	54IUGbd20L6ciyDmd7LaMS9hl+1AKwFuS99F7vpYExZl5RB7iyw/Fjdfa2rTQlnO
	4c2t/e4YTTYE45uRcEoXvnOadEJLVOKk80DQCAQltuVzjtJJRGwNIEJ0vCvZUvO0
	IWj6ZA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda8nv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 17:43:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab69fff4deso20363771cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 10:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753983814; x=1754588614;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XgQLj33jhp7/creFx0MYZQCfK0nDYyjfst1wTym5RW4=;
        b=P9Yhwg8J27LifA8DK5XUQ3OV0E7JtITlaYMPYPpzyZV6I679fLUIuGCVjy5ssDd6Ik
         wqGooHtmrV7Ve3UNCVW2yTMxZLn+GsManMcjl6eRTOBm3GfqAuTcUnM3UWbX0cn8tPfu
         ierK+1tQ4SkOATjVElJ0oy35VnI5sazXM1q/xMeF6o8H61gnaKaUQpGpJ5jkD4HjV/mk
         T3pTPF7jmib3l73B5uSZDGKdxGVhgzFYOavEALvkCZw046I/lRc7P0dmBvnv5FUbL4VC
         B4YUkpt/WqQZ3BNycNxOiyi1LZ/O6cNkL/cK689XBXeOrz8qe3QFcReedQB3FRyj36yX
         dNew==
X-Forwarded-Encrypted: i=1; AJvYcCXrUAX6jhE2KMxFfKiugUS+YoJ7m4ZVHI4BKyUtai6DKxt6ZZnx7yqVrn+MqQf3/0s4FdsId2d0BYpFu7Yh@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf/yWcNQ6WcST3sA8YFC6uxeHpeujDldfb/5Kohwfjd/pvFPuA
	7mHue0CSVpM/i57gtwhEX3qMgapF805KsgQ0x+/2KlaEUew/4rRgH9aTG9AsbPhWqlXgoLG7oMq
	GMVmf0dRm551b5zzvI3RDD1gvSfgRwsjv2OxIl9sJ+6jmEWCCvl80QbmlJN3Iz+tyb9pF
X-Gm-Gg: ASbGncurmHzbtE94kkdXYX4h54rZ8UdiJ7/v3X+MN8c7oPF0pYD9zQ8NLSsggwdH9V2
	d6S2GXBVVcipYcJjmQsgKbf1GD3oEQUtT7BRqhJPO+Z4j4c7SU35ZXlIF5UVH5SVeQ51axekxWa
	0w7BEQtQVcBwdKuYbQEpU7SlksD37clQVVqf4/l9PuW8mJ6Jo9V16OkQZAl00V9I/xMNUGxvaCr
	6Hv6Osf9DhBonm8hRnWIGOdTLbAfH9CLQ6vBH62aZbw+zBKREKgI0K/2Jp0G6Wikz3/zpcUZxGk
	Ao3h5tblJLJnssk/e9CF4oWmryOb807K8OICprRsdiZJvzy9c0BKuXRoZKIH3VfhpZdJNm4bMKn
	8au4nIUrnAjHwKyn5XTF+9qqwXeIKz412GRe8XlFsN5ca9Nhz2cGL
X-Received: by 2002:ac8:7dc5:0:b0:4a9:e225:fb6d with SMTP id d75a77b69052e-4aedb99e470mr112576911cf.21.1753983814125;
        Thu, 31 Jul 2025 10:43:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU41tcMiInT49q2UVBzc1ln2V3fBjU5vwnqygxgxHg5zY8lqlNmM/ASrKrTWFHWA7RYA25DA==
X-Received: by 2002:ac8:7dc5:0:b0:4a9:e225:fb6d with SMTP id d75a77b69052e-4aedb99e470mr112576371cf.21.1753983813558;
        Thu, 31 Jul 2025 10:43:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88cae541sm317422e87.153.2025.07.31.10.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 10:43:32 -0700 (PDT)
Date: Thu, 31 Jul 2025 20:43:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Cc: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ufs: ufs-qcom: Add support for DT-based gear and
 rate limiting
Message-ID: <fl4t5fpyd5o535djn3f5vbq4lqqtwx2dzcphxfdf7s6kxedcsb@yz65chgbcgd3>
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
 <20250722161103.3938-2-quic_rdwivedi@quicinc.com>
 <2ihbf52nryduic5vzlqdldzgx2fe4zidt4hzcugurqsuosiawq@qs66zxptpmqf>
 <f61ac7b6-5e63-49cb-b051-a749037e0c8b@quicinc.com>
 <CAO9ioeWLLW1UgJfByBAXp9-v81AqmRV9Acs5Eae9k4Gkr1U0MA@mail.gmail.com>
 <728cde88-1601-4c36-976a-3c934a64be35@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <728cde88-1601-4c36-976a-3c934a64be35@quicinc.com>
X-Proofpoint-ORIG-GUID: ked54X0f1_Sv7J2C8Ce5vVQkaVMWLYFl
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688bab47 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=w8oFfr48thh2NtF-ymIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ked54X0f1_Sv7J2C8Ce5vVQkaVMWLYFl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDEyMyBTYWx0ZWRfX1D0NP5P1XFpR
 SZRni1oq8VZFQ8+AkQPHmdGCZmC3AkTKraoHqHpA+l0R2EHKHJfo6dnjz2Kxeghn7KW7Otmn87W
 dj0lxSbKwU99jJolrYVKNo5lGV3VzHwV4GjzNorjisPDHw0TOkJsYFCddaiEVBGHpCuQMdtNrsF
 nC11naz8iN41rIY8yu63gaKvzbdh2g60Z/I5/YUCJnQGRiEHoZuM0mX4r7COOSIQ/5gFcB2uHvr
 /PiKdLb7xerAGCY5Jv5p9HFapsva4iFhVY7HJwaI8yV7awgUozpR59JZsXPPx/9iVSs6zAVEQ5c
 kCCGilohO+EGWpJH562p7NdUVSKpHclq2ayUwSyMRlphEq5Mnp+i9OOybpGY98PSNjJ1i9V996I
 871f1J1pac6wolzcEMZK9ndr2QeOQVinugFnGUc0SpU2hiHwO6m3WFG8b0AtG56AgRLOnviJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507310123

On Thu, Jul 31, 2025 at 09:58:47PM +0530, Ram Kumar Dwivedi wrote:
> 
> 
> On 24-Jul-25 2:11 PM, Dmitry Baryshkov wrote:
> > On Thu, 24 Jul 2025 at 10:35, Ram Kumar Dwivedi
> > <quic_rdwivedi@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 23-Jul-25 12:24 AM, Dmitry Baryshkov wrote:
> >>> On Tue, Jul 22, 2025 at 09:41:01PM +0530, Ram Kumar Dwivedi wrote:
> >>>> Add optional device tree properties to limit Tx/Rx gear and rate during UFS
> >>>> initialization. Parse these properties in ufs_qcom_init() and apply them to
> >>>> host->host_params to enforce platform-specific constraints.
> >>>>
> >>>> Use this mechanism to cap the maximum gear or rate on platforms with
> >>>> hardware limitations, such as those required by some automotive customers
> >>>> using SA8155. Preserve the default behavior if the properties are not
> >>>> specified in the device tree.
> >>>>
> >>>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> >>>> ---
> >>>>  drivers/ufs/host/ufs-qcom.c | 28 ++++++++++++++++++++++------
> >>>>  1 file changed, 22 insertions(+), 6 deletions(-)
> >>>>
> >>>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> >>>> index 4bbe4de1679b..5e7fd3257aca 100644
> >>>> --- a/drivers/ufs/host/ufs-qcom.c
> >>>> +++ b/drivers/ufs/host/ufs-qcom.c
> >>>> @@ -494,12 +494,8 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
> >>>>       * If the HS-G5 PHY gear is used, update host_params->hs_rate to Rate-A,
> >>>>       * so that the subsequent power mode change shall stick to Rate-A.
> >>>>       */
> >>>> -    if (host->hw_ver.major == 0x5) {
> >>>> -            if (host->phy_gear == UFS_HS_G5)
> >>>> -                    host_params->hs_rate = PA_HS_MODE_A;
> >>>> -            else
> >>>> -                    host_params->hs_rate = PA_HS_MODE_B;
> >>>> -    }
> >>>> +    if (host->hw_ver.major == 0x5 && host->phy_gear == UFS_HS_G5)
> >>>> +            host_params->hs_rate = PA_HS_MODE_A;
> >>>
> >>> Why? This doesn't seem related.
> >>
> >> Hi Dmitry,
> >>
> >> I have refactored the patch to put this part in a separate patch in latest patchset.
> >>
> >> Thanks,
> >> Ram.
> >>
> >>>
> >>>>
> >>>>      mode = host_params->hs_rate == PA_HS_MODE_B ? PHY_MODE_UFS_HS_B : PHY_MODE_UFS_HS_A;
> >>>>
> >>>> @@ -1096,6 +1092,25 @@ static void ufs_qcom_set_phy_gear(struct ufs_qcom_host *host)
> >>>>      }
> >>>>  }
> >>>>
> >>>> +static void ufs_qcom_parse_limits(struct ufs_qcom_host *host)
> >>>> +{
> >>>> +    struct ufs_host_params *host_params = &host->host_params;
> >>>> +    struct device_node *np = host->hba->dev->of_node;
> >>>> +    u32 hs_gear, hs_rate = 0;
> >>>> +
> >>>> +    if (!np)
> >>>> +            return;
> >>>> +
> >>>> +    if (!of_property_read_u32(np, "limit-hs-gear", &hs_gear)) {
> >>>
> >>> These are generic properties, so they need to be handled in a generic
> >>> code path.
> >>
> >> Hi Dmitry,
> >>
> >>
> >> Below is the probe path for the UFS-QCOM platform driver:
> >>
> >> ufs_qcom_probe
> >>   └─ ufshcd_platform_init
> >>        └─ ufshcd_init
> >>             └─ ufs_qcom_init
> >>                  └─ ufs_qcom_set_host_params
> >>                       └─ ufshcd_init_host_params (initialized with default values)
> >>                            └─ ufs_qcom_get_hs_gear (overrides gear based on controller capability)
> >>                                 └─ ufs_qcom_set_phy_gear (further overrides based on controller limitations)
> >>
> >>
> >> The reason I added the logic in ufs-qcom.c is that even if it's placed in ufshcd-platform.c, the values get overridden in ufs-qcom.c.
> >> If you prefer, I can move the parsing logic API to ufshcd-platform.c but still it needs to be called from ufs-qcom.c.
> > 
> > I was thinking about ufshcd_init() or similar function.
> Hi Dmitry,
> 
> It appears we can't move the logic to ufshcd.c because the PHY is initialized in ufs-qcom.c, and the gear must be set during that initialization.
> 
> Limiting the gear and lane in ufshcd.c won’t be effective, as qcom_init sets the PHY to the maximum supported gear by default. As a result, the PHY would still initialize with the max gear, defeating the purpose of the limits.
> 
> To ensure the PHY is initialized with the intended gear, the limits needs to be applied directly in ufs_qcom.c

The limits are to be applied in ufs_qcom.c, but they can (and should) be
parsed in the generic code.

> 
> Please let me know if you have any concerns.
> 
> Thanks,
> Ram.
> 
> 
> > 
> >>
> >> Thanks,
> >> Ram.
> >>
> >>
> >>>
> >>> Also, the patch with bindings should preceed driver and DT changes.
> >>
> >> Hi Dmitry,
> >>
> >> I have reordered the patch series to place the DT binding change as the first patch in latest patchset.
> >>
> >> Thanks,
> >> Ram.
> >>
> >>
> >>>
> >>>> +            host_params->hs_tx_gear = hs_gear;
> >>>> +            host_params->hs_rx_gear = hs_gear;
> >>>> +            host->phy_gear = hs_gear;
> >>>> +    }
> >>>> +
> >>>> +    if (!of_property_read_u32(np, "limit-rate", &hs_rate))
> >>>> +            host_params->hs_rate = hs_rate;
> >>>> +}
> >>>> +
> >>>>  static void ufs_qcom_set_host_params(struct ufs_hba *hba)
> >>>>  {
> >>>>      struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> >>>> @@ -1337,6 +1352,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
> >>>>      ufs_qcom_advertise_quirks(hba);
> >>>>      ufs_qcom_set_host_params(hba);
> >>>>      ufs_qcom_set_phy_gear(host);
> >>>> +    ufs_qcom_parse_limits(host);
> >>>>
> >>>>      err = ufs_qcom_ice_init(host);
> >>>>      if (err)
> >>>> --
> >>>> 2.50.1
> >>>>
> >>>
> >>
> > 
> > 
> 

-- 
With best wishes
Dmitry

