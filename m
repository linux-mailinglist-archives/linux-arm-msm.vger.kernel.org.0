Return-Path: <linux-arm-msm+bounces-99118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBVgId/pwGl6OQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:21:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7802ED760
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:21:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09EAB300826B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8277735F190;
	Mon, 23 Mar 2026 07:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGSuSkPe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F5dxcli+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF04235DA7C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774250441; cv=none; b=gNnxShhlP/PtKXgVcV9VEqN+B/yPVOT4auTylue2Dhu6KAd5Yo3ALIIk9T85UwYJH4D1M1lY2zscar9/nXp2ZtVHawK1wkRMJZ3b4lW/ebY3hSEzgCav2KwkZSuveglbPX3O62F5J2g1K9UhmaxKJA9GD5MLBXFxcUP6YfrX+ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774250441; c=relaxed/simple;
	bh=UtYQiLf9XT9Sq5MX9hWcKdGPqR2rORWlqfgKn5TIXQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kuFkcQmCy29RJ8r+aek85rib+p5Odal3YJ+++y7/oXye493ypysZRFUYBEZkpx2SNALFbQdjf0+T77Ui8yaIL0HglrEc22C/mwJlQ/VZjBCqbJeC6NY0KyC7PH5h/0ke9ssAW0hYt8XXw7K8erfnGk6Ag+1FoLWzCmgXQkmxBgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGSuSkPe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F5dxcli+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N74DPp3030265
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DBBxWS8d6swCU6YER0mu2txJ1/iuLHQ4Yi8SS9B1daI=; b=iGSuSkPe6DaKM+mr
	koK2Jt+0o4fmUCOZs6jWoj/cDVN20VeF9WBh2R3UtP28ncslm24gc1XCTN+WJWcl
	fAwGB5Mt0GGBS5o/aSMH5a7cU+/QuSVlT1DAMxBW9HB6S81NXoA+w7BL8enlZ57A
	JWtCB4R7q8Veiv1LFDySvPKY1F2KTAgUjOf33dlgQ4yeYveLx3maNTzsxU7xFbJT
	Rzex4RoO3VhtRO6pMsWbD8K5pIo8IXha8XGLl72qfibtvZnZpuOf7F2ULDhjdgEq
	musXL0N4+miEre2MOKMMrPzGV5rm/SYaQs6Tq+WO61bigBiSxSpe+mVp7MfDY1Iz
	L1psHg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng496g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:20:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a90510a6d1so36533675ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 00:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774250437; x=1774855237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DBBxWS8d6swCU6YER0mu2txJ1/iuLHQ4Yi8SS9B1daI=;
        b=F5dxcli+8dkDfdM3Rbw8pY9scB4zZIt694/L2O+aCLetKs94AvFKScrHJedIMt92Aj
         kzGB5ROm4EzxfqvigAR/AqH4yRrBXCkK7/46Timw48HU62opCd3YKOjeE6m7CDefJIPa
         VRGVr41wdKnlChbdNfT4de/kB5upAOB9Qt9h2v2EWNZt3t+NxKj1x8BEnLYmy5G05yoG
         55TgXHjp9uHzGMoLJyiUKEXVpoWqYMOf5/FyvENvbKu/7rSdzNL3mYaK9FpXHtcqbi0u
         UBh/VPg74GGpXUpL1R1KWL2b7kxWmOXayn4Lf5Hr9rQPqGA6msC70SRoHzcaxr8inNrO
         aqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774250437; x=1774855237;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DBBxWS8d6swCU6YER0mu2txJ1/iuLHQ4Yi8SS9B1daI=;
        b=kn3tqwqmBZU8+PLj3AGKbmTLWyrJdtU8xHH2gvZmpgphhb5JoO5N1O8rljayVNPGNi
         oDRj0o2K7YDWXxdjsAVsiw4VDqLcec/E6A+rJqDSey+OXGn5e/e036Lw4Qh0hK98ZWf/
         07ZgNTka/YfNymXraFXbsoIrFJsuUj9IJfgWh3B4TlaoblLL6ANXp8RyOa5sH1mcUPv5
         dNBoBnpbn8kM0GIUXrPiSNPU7AX1dY6+cSYVs+PpHgfETKUcJ0w7m+7JH0oaPl8K+V6O
         VdajBsHJkrYdevnbu5syFZ3DzDz5ijUcd5lIQd9+KOjUVXFuYMoYalrblBdqoJdwaVyM
         kUHA==
X-Forwarded-Encrypted: i=1; AJvYcCXeOUQNwZl3cwOq9q4o5/VGGm2koaZyOQnOwKwdo2CR0jaJn2UXq4d562grOQmWzRPFS640s7uuZBQSoEku@vger.kernel.org
X-Gm-Message-State: AOJu0YyB6vAss1rNjVczyq6YhqmlaCd7z9Wcym6+kT2oO4WU9iXbRXcx
	FkqBx9mRlZdACTC8bZ2iNIbnuukKG+fy1ngPOQJcBFXC2gpWhv34Bz527O/VFpKQciKwWgtQwed
	W/qFIoOuJxoA0sxESBbq2Lv/PnYgdggeOyrqjYtIEWSN5ar+nyX0LucrIG5z1HvceAxhW
X-Gm-Gg: ATEYQzw5X4oOtY22y+l2cEDkGmu5w+b0G6xsO2uJR56EftJQ0H/3Jk+EwfWOO6oEmZ0
	hy8cJ6ahMwWsmPURyL41nz582xEyJeB0DfPZYlM905HFoB+XrwdVk2Wi/I3tDnv3GhexZzScVVF
	25kClBA5/oNDs9ed7VWurOQ7LMpgG+a4+FCXbo4p+X5hcO5GHe/wXQaq33+UkpayJZu0P/KgBFg
	J1XnDly7uoz7VAFJ1rrDWMrHmk9mD/i+AdAi/7XOdgteLRCz3jRIArkxWaCjguqTcfqnS66tNhg
	VgYgvv+WBWR97YxL2kMLVeP7zjbwUXyP9H5jrLiaeNbQSg9xZ440+H+38w0jY7TpzXpqn13l+ZH
	jlblbxbGqo2fy6AiMn/qYz+F9IZkZwO7fK4DDCKIifWOOdpvTGrUgAg==
X-Received: by 2002:a17:902:ea04:b0:2b0:7502:6ebe with SMTP id d9443c01a7336-2b082850022mr97122775ad.25.1774250437493;
        Mon, 23 Mar 2026 00:20:37 -0700 (PDT)
X-Received: by 2002:a17:902:ea04:b0:2b0:7502:6ebe with SMTP id d9443c01a7336-2b082850022mr97122595ad.25.1774250436949;
        Mon, 23 Mar 2026 00:20:36 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08368eb9asm128684195ad.69.2026.03.23.00.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 00:20:36 -0700 (PDT)
Message-ID: <14610f07-52c2-465c-d407-fff1974429ea@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:50:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v8 11/11] media: qcom: iris: extract firmware description
 data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
 <20260319-iris-platform-data-v8-11-55a9566ebf60@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-11-55a9566ebf60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xuAYJrCh7gjm-veSfGTOLTL62PZU-ymE
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69c0e9c6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=hbzS8gabZINpAvasuVNEhA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1CAC9Jn3K0YispLxHrEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: xuAYJrCh7gjm-veSfGTOLTL62PZU-ymE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1NSBTYWx0ZWRfXwyt/dyksanV2
 1HPqaUxRVx5mkBO0Zg+FG7BhYuP60EHtb2U7H23qMdlM09JymAVHT6lvR1+tVhrHt3VMqrI232v
 wdEyM+3sC3pv6I2GxwDgoPJcWzk7H0eb2KSMX6+yrQB4AL0IHnY3bTayti99FJ7lpREFFdBqfgY
 ui71MlQiNoEbeX3z7yI++Jk70QWGSlu0/+Q5GZblV5zjcAYgoeHYkOW4QtycWorhKrJ/CjUiJ63
 pHiz8/k97A06PCU7kVnzGu7HwCb0OAj8++F2T7kT8+3g6f8qboIspXid5z0e4HOydzRAT32UjNo
 Rzj8WLZuLmGdNREYokQ9maDVdfLWSz2/5AuxAbOPRacGJ9uNzhStU61AVuSb1OZkIqaDwjxV4i3
 U0COSdFPfO3lCsug4FZxni9cmb7igzip2q9ncY60lyOo5fOVR0p4H8MmDehuAc7kaLvPywPpwcx
 VORMjDAO/n48FZBXK1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230055
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99118-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C7802ED760
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/19/2026 11:29 AM, Dmitry Baryshkov wrote:
> In preparation to adding support for several firmware revisions to be
> used for a platform, extract the firmware description data. It
> incorporates firmware name, HFI ops and buffer requirements of the
> particular firmware build.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c     |  2 +-
>  drivers/media/platform/qcom/iris/iris_core.h       |  1 +
>  drivers/media/platform/qcom/iris/iris_firmware.c   |  2 +-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  2 +-
>  .../platform/qcom/iris/iris_platform_common.h      | 15 ++++----
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 20 +++++++----
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c | 41 +++++++++++++++-------
>  drivers/media/platform/qcom/iris/iris_probe.c      |  3 +-
>  8 files changed, 57 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index fbe136360aa1..ef7f6f931557 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -295,7 +295,7 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
>  {
>  	struct iris_buffers *buffers = &inst->buffers[buffer_type];
>  
> -	buffers->size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, buffer_type);
> +	buffers->size = inst->core->iris_firmware_desc->get_vpu_buffer_size(inst, buffer_type);
>  	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
>  }
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index e0ca245c8c63..7f36eb65dcbf 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -99,6 +99,7 @@ struct iris_core {
>  	struct reset_control_bulk_data		*controller_resets;
>  	const struct iris_platform_data		*iris_platform_data;
>  	const struct iris_firmware_data		*iris_firmware_data;
> +	const struct iris_firmware_desc		*iris_firmware_desc;

Missing documentation.

>  	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
>  	enum iris_core_state			state;
>  	dma_addr_t				iface_q_table_daddr;

<snip>

> index dd87504c2e67..d36f0c0e785b 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -251,7 +251,8 @@ static int iris_probe(struct platform_device *pdev)
>  		return core->irq;
>  
>  	core->iris_platform_data = of_device_get_match_data(core->dev);
> -	core->iris_firmware_data = core->iris_platform_data->firmware_data;
> +	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;

How will iris_firmware_desc be selected once a SoC supports both Gen1 and
Gen2 firmware?
Today it’s fixed in platform_data, but eventually probe would need to
choose between firmware_desc_gen1 / firmware_desc_gen2 based on the generation.

Thanks,
Dikshita
> +	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
>  
>  	core->ubwc_cfg = qcom_ubwc_config_get_data();
>  	if (IS_ERR(core->ubwc_cfg))
> 

