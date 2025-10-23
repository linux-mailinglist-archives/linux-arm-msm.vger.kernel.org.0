Return-Path: <linux-arm-msm+bounces-78443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA05BFF295
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 06:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 39067356ACC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76E2235063;
	Thu, 23 Oct 2025 04:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iuESghfv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B576221F39
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761194816; cv=none; b=pZbVS1lCvNgw2JUJMw5opI25R1UcAw3lf6N8QN1zM/sZRy/ymHRIMd2P+xhWvyxd52fDig55/S6qVWgvZUAHPu8SwR0uYwIJwdhFNVNEri0s0eKOyRpSvErWGievqS/7hPPSZ/9b4j3vIeUPoymo+wA9RbnUfJPGDbP+m+XQDK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761194816; c=relaxed/simple;
	bh=RQKtk6VRABQ+vBOTGNpTUlGbKB9xzSwEgDGBB7enF5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GPTLTlmyFGdyNTyxMeOMu2mSe/fq92Rbds9wfoQzpNe0pwI7B6EDCbVTjANMfEX/RByT9rM0ur6kxIIaHuTANHaeZLIQRH7BOoz2K0k4KGwIxWESitQaoRPVjLu0ERsnC2hTwW+s5GBcIRBqdEIGEXrDkNDmFzc7/uhR86BxUHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iuESghfv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MJ1OcS011696
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gk8IGEC2YqxXgoqIuJ14jd80rHVy4Sx5PMH+RdrI/zw=; b=iuESghfvwcO2UjYB
	T+Vz8dJDuP/AdctHTIXWLfq2jmTl7/ARLFKyrTwRPQAVnIteBHxh7V0lUN2EpxVl
	aRpFJW3fWh+jEw1VPPz6jHiLG8B6VTSyHbAVCyIx8JV8sZmvjt00984uJGiLyny6
	DcAEDQNM6kZ1r2gSvpSEHpaoYSKDzvbgx5E2nPgBz3BB7dCHEuyRq0/c+Npaj8lA
	ytNdYcx0/nElPsxjuYrlh6EaxXrEhprtkQIgceuYUVrzUbi8qVs6uYxkx1pCA64F
	5iZ+0FFkR27vp8rKbLJ6rfM5ENoMRlki0ZjXnSkin2QU8cCBaIbOb+XRVEj6bK7/
	9otZKQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y52497cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:46:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2698b5fbe5bso5853365ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 21:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761194813; x=1761799613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gk8IGEC2YqxXgoqIuJ14jd80rHVy4Sx5PMH+RdrI/zw=;
        b=lvSCSv+sSg+A9sjVwrrtwfFkRRsdVU4o/JVRabtmKXYKKwhyKOEVYRK9ke9PruMRks
         7cr+oQZa692eUe+G1ThXHvsHovB83kfjrNA081uWryejVUB1w6tfMdF1acKG1gdVBzLH
         y4i+APzDxqEucLVzoi7bb+JnG8VoaC/IL+v/kzgoEcQgA/1h5vaD1gOYcCsQfPbm6AZX
         2Gf34kh+RD0j4YLcBOPcycgbh/LwpMFDcnwASxzFFuK90RfswzNeSscoNFrxTJMZFGeH
         xDPL6rmTrOqdi5+eHEhyTSQhAp8agKOKCnxTFb/SE3/IdrqqunY3swOYPpKontD8NvdZ
         aAng==
X-Forwarded-Encrypted: i=1; AJvYcCVgTXYpBRHd6tGBnUbzOVhvVi9p53Y9HuWmVfIdUxXNAtUcmq9Z2Vj31wEjxtajsVoTtRwXmtFZ1RqeJrJ8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrv47MhejTiLkSvyF82zX/6OaNgXUu5e7R/GCS1bkiijoind56
	XRHTo6+As3/wfYNyVAXbZTWgYbTYSSfs4JqtUhkkhkpA01BfgmSX4GlN0yJv0aI0xqGz4+gx5OQ
	u60r1gbclhwo5LFfE1zepcjPoshm7eyLA/SjrSNvgePjkubyV14kWieC9duzLO3g8M9e8lJ7ItP
	IW
X-Gm-Gg: ASbGnctrzUsKLWd7nm7f7VB1ZffDWpoc9c7uY6T4rkoYeloLvOd6NroPmw3kwdOdGMK
	JZWk0f4eTXpjxwiyaBwY6nxscMp1E4KompiEu8zareyoJc7l053aBr0nWPUZt35ziVYawh+6uXF
	Z2i+Lhis8Na0HxvBRFSWX/ILsH8PU90ZnHZZiWCf5wn4EOvYkx4NzKAq49/Dj8xHNWHH6xljVnO
	Su7UbFGRWxiHZvURd0XPlpAdb0jlypuY6VUlFwJsg0/cdEXBA/Ae4BbUNBZA8zVk73YFjVTA/rx
	Hd1AOtM4kvtWBHDClSHi4x+VkGKhmuzzURYkMwkuaqupwR+ikSfxeN+Tk6iDYHJaBCXhhpQOWTu
	nbOIO2Si0Veve6epTYLLHgUw=
X-Received: by 2002:a17:902:ecc1:b0:293:623:3265 with SMTP id d9443c01a7336-29306233761mr57706395ad.34.1761194813371;
        Wed, 22 Oct 2025 21:46:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtUb1Wy6VbMGMaIZJ2YrmZqxzkjXSfCmpKXsJsxh6/rcBZgAjsqgwz2PjE+JV6X78IUnifdw==
X-Received: by 2002:a17:902:ecc1:b0:293:623:3265 with SMTP id d9443c01a7336-29306233761mr57706115ad.34.1761194812942;
        Wed, 22 Oct 2025 21:46:52 -0700 (PDT)
Received: from [10.217.199.21] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dff383693sm3389881a91.3.2025.10.22.21.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 21:46:52 -0700 (PDT)
Message-ID: <4831d12b-a42a-464a-a70f-e0e40cf4ae4b@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 10:16:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] soc: qcom: rpmh: Add support to read back resource
 settings
To: Bjorn Andersson <andersson@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-2-5c7a8e4df601@oss.qualcomm.com>
 <litd6qcxuios7uwwcrz55ea24kj26onrjo2aekouynsce6wslj@vatjbulg64mb>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <litd6qcxuios7uwwcrz55ea24kj26onrjo2aekouynsce6wslj@vatjbulg64mb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX2i/HX9CxfR5P
 gOUe7gDWOZC2HaCofsMFgNMSVJ7RlsBrI2VRN2eEb8clYM0eKlViOsUAR9gfIcLWBRTq19vIORe
 J/h207Sv2z6sO+uXHiVtxKn92OxHn71dufrKtWfIFJIDJqnTmuBXru65pLQ/FUdI4+bHJund+4z
 E7LSkmtjA718/5bk3awwXddgtsDdmgezdODL7IC5NooN8ybijXwv4PFfxEDcTWoPawt+m0iNhp3
 pJ7ka0jwmSfvYD6zNvHp/AAkd8YOnNRWrreitvCXeNCcFTnLrqeri0MQasscH4o0HQeSabViGzY
 ViGbpMW9dNrrpBRVnW3FeA9Ods5kY1sriuC6Vmm4gnRLHaU769xIW8f//4BZK53gZ5/FN8GHX0v
 NHAqXTk1wnL0V2BYeChRrtHDaHS8hQ==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68f9b33e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eVGerQaZic2NLa4W9s0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: j9vBraLjRqioCEpPVR2a4gM40bzvEza9
X-Proofpoint-ORIG-GUID: j9vBraLjRqioCEpPVR2a4gM40bzvEza9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155



On 10/23/2025 2:51 AM, Bjorn Andersson wrote:
> On Wed, Oct 22, 2025 at 02:38:54AM +0530, Kamal Wadhwa wrote:
>> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>
>> All rpmh_*() APIs so far have supported placing votes for various
>> resource settings but the H/W also have option to read resource
>> settings.
>>
>> This change adds a new rpmh_read() API to allow clients
>> to read back resource setting from H/W. This will be useful for
>> clients like regulators, which currently don't have a way to know
>> the settings applied during bootloader stage.
>>
> 
> Allow me to express my disappointment over the fact that you sat on this
> for 7 years!

This was a dead API (even in downstream) with no user since SDM845/ 7 years.
Read support was eventually removed from downstream driver too for the same reason.
There were early discussions to remove read support from RSC H/W, due to lack of users.
Its not realized yet and all SoCs still supports read.

Now we have a regulator client requirement to read resource votes and reason to bring back this API.

> 
>> Link: https://lore.kernel.org/r/20250623-add-rpmh-read-support-v1-1-ae583d260195@oss.qualcomm.com
> 
> Why is there a Link here?

I will address this in next revision.

> 
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/rpmh-rsc.c | 13 +++++++++++--
>>  drivers/soc/qcom/rpmh.c     | 47 +++++++++++++++++++++++++++++++++++++++++----
>>  include/soc/qcom/rpmh.h     |  5 +++++
>>  include/soc/qcom/tcs.h      |  2 ++
>>  4 files changed, 61 insertions(+), 6 deletions(-)
>>
> [..]
>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> [..]
>> +/**
>> + * rpmh_read: Read a resource value
>> + *
>> + * @dev: The device making the request
>> + * @cmd: The payload having address of resource to read
>> + *
>> + * Reads the value for the resource address given in tcs_cmd->addr
>> + * and returns the tcs_cmd->data filled with same.
>> + *
>> + * May sleep. Do not call from atomic contexts.
> 
> * Context: May sleep...

I will address this in next revision.

Thanks,
Maulik> 
> Regards,
> Bjorn
> 
>> + *
>> + * Return: 0 on success, negative errno on failure
>> + */
>> +int rpmh_read(const struct device *dev, struct tcs_cmd *cmd)


