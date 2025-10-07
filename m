Return-Path: <linux-arm-msm+bounces-76198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6818CBC13D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 13:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F32C6188F81C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 11:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF282DA76C;
	Tue,  7 Oct 2025 11:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5opgIXz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A288B212B0A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 11:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759837104; cv=none; b=Diik6/tc4ep1y0SrWlGqCdW/vcG2kxQ/tv7Z/tdfIxGq/YHED5bXEkYDH+AohUvhWy788N4of36axoUSjY1yiTbgwFpfcZ4t2Pdta9ek0mjUlzs7YaAC7Xwu3VrV8yzM+GquJMQo/p6Uy2qzQ8ASv8WJqZIkQVLBU1Dz1d3gZ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759837104; c=relaxed/simple;
	bh=ZXrGelmvQas8vmmTp/wX0exf21knoe1W83mDfua+9fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QuTjx0yt8HNixIKyLFfReEBpunoNcKtXOZ00+D9WMZ+cqaZU0N8uof5YMOS5Mu7ZKi/WJg0HQYkohSqedaNek+vgPrBHZsbdO3i0pOdWMloGdeWzLG6iZHtB6pj85k+MUTsGd5MIAQ4LQt76yjecS61BLstm8dJAAgkGAUmIbvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f5opgIXz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597BaIY0011762
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 11:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCYeVPjY1mm3YEzAO8t9rcepeUOr5QIFPQ94aq1HS8A=; b=f5opgIXzjj32H8O2
	GznYGxX7b9hB7zfT+3AMVvQ1pink7gbD5s75hTBwmdY9fop0FyRPss6FpvsX4iJm
	ieMfCKXwwsvaDQA9ibIcq8G5h8CTF19JfPuapbTFQ64why/7SgMqsKtptku/ncxX
	E7sBbKsKIakPF9RF+X39F1iP4nX6/nBoh+/vHrc2E7NPj8VgIHCLxVq0pxkM8KyV
	htbGGg/KTmp1jmr3nNxDNWzzlFtt9fBaljuYtbq4RIH5ragoacVHNu5Mp8yZnHyE
	HBCnyBDTTwinimNRtcOHSbdCebsOHem4dHqb0qqgadoVPdTe2UVClST0ORpwcLeE
	bLFK2w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9dy7ju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 11:38:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-780fb254938so4968599b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 04:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759837100; x=1760441900;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GCYeVPjY1mm3YEzAO8t9rcepeUOr5QIFPQ94aq1HS8A=;
        b=TUBqWQ0Wldm4PB0hmn0ONoVY5P/XEckMTZNJYqmQESFQbeqU7YkoBrAKsxX0/92ZM3
         osZN+coM2gWnYtJ7mh+qSqzPfOozzAPrZUj2ix9eIcAjmQGjq3Wjt3drMOokZ1VDxRA7
         xfJ4a3FhfV1zCRFOCMCRz6YKDPxiYDUdJ0RSkot9eBDXB5S4KNuvZATU4mo/mzyJKs+g
         pfAKAMkv9PcD5uB/QwJP4it1n20jy3TQKWAM+ZNb9EKRjzLIIUpVciemgEj3HpIvd8EU
         Kcm1li+8KOrcVbo+85NJOBFMfPxw5xusm6WgURBhRYOtFimpyRq4UXaApapi8NSRFSnJ
         CLwA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ6gJyna9y4ngSLIeOb9Rm/W/PmK0HJ8WtSV2Q6v8IhjSpLDzA4AmwWP+owVGNEfKladKpDElxzqRxfKmz@vger.kernel.org
X-Gm-Message-State: AOJu0YynEC92Qo0qJWzaBsuY3rnWoTTmK6DywNHgR6QkwY82XYVBJ7B4
	tFD9oaUIN5VVYOTFOX+iuJmfzGYkxvtBAhba/aAZkkwh/VmohzmLv/rfY77cQp5S7met4WAgc4R
	JxFpGkgfYHUmy3krzPhtgvwnlO5G7IvrD/Cwet9PR+jT22RhH24AD/JH4t4FAyglkAN7M
X-Gm-Gg: ASbGncvOYcGCYfkUxK8cx6m04jFYsRgF9C03xDJ2S81IO6bMAiZmpDtDvOGJLOAqynz
	irk4FvcANJnu3i1Wg/9Le4wMxMDPQoyYBACskYuQ9SaVDUSy7/vEROSUVTyleApBBpgnVmgKqS/
	It2KVdkKYWbUtIgLRX6sTK3vCFdmTwE9SwfM0epxsBxTEkPkTwbZmRvobj7FTIxw2Wkdh+Lv6mB
	piwADzs7VBFqCx126iJW7kkyK2JZyZVdT6PaM8282hUVz6ICb03omVLDSEYBuX8/CUofpm8F9aB
	EFuHsmM7QvonmIS5qUIpo6BbpBhGflcrKVu3sF6fxbdntyrsjJp78s54EtGknBLJxP+TsulFP2Z
	Wbg==
X-Received: by 2002:a05:6a20:12d6:b0:2c6:cdcc:5dc0 with SMTP id adf61e73a8af0-32b61e6d11emr21191684637.16.1759837099734;
        Tue, 07 Oct 2025 04:38:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjww+c/j8M44jX9PgI+h6Etypkqn272KmpewHvoFomBsMZzaaIb9jb1O3bbZyUinW/tDhShQ==
X-Received: by 2002:a05:6a20:12d6:b0:2c6:cdcc:5dc0 with SMTP id adf61e73a8af0-32b61e6d11emr21191635637.16.1759837099017;
        Tue, 07 Oct 2025 04:38:19 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099ad926fsm14634202a12.5.2025.10.07.04.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 04:38:18 -0700 (PDT)
Message-ID: <aff68f3b-298a-2cb0-c312-808d7efce6f3@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 17:08:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: iris: Fix ffmpeg corrupted frame error
Content-Language: en-US
To: Vishnu Reddy <quic_bvisredd@quicinc.com>, vikash.garodia@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        hverkuil@kernel.org, stefan.schmidt@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251006091819.2725617-1-quic_bvisredd@quicinc.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251006091819.2725617-1-quic_bvisredd@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e4fbac cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=kcjkJnMakA67_LZCmskA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tP2qptRcRlZTIHZ3EKnaVNywZJLrs_ZJ
X-Proofpoint-ORIG-GUID: tP2qptRcRlZTIHZ3EKnaVNywZJLrs_ZJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX7FLcGF2IkX8Y
 XGirW9dX/qOHWnQTDiXUZeZSBCzWdMBiFZYiCcas4GeJmhgufZ/C0GlfhI44GRsLg+1j2T+CvFP
 NQwQY/EpRwLyJ1QAYeI8/TB4cn+uikT69szwA9chQe7ABTQlbcipW3Rc09Lxhph4wQhuwQDVy82
 PTDdWqValPIT+NPou0LH7VnVdt9s9yyh8PSkxsCNh87ck0hI6f/mDT5Igb3YCR1lYtrCMN0W+oq
 zvENYF8QmBMBX2XbTwTEvzoACc74xNrqXV+ShMz0hbog/yfP7SOeXyTMyjc7aGEr72WvejEArRi
 8wzZAn6rIo4mAZaA7DJGH2uM07wR4ad+ZnV01rwJ88NY4ZpWmEkNv5W0HJbtI2WrDK3no/cMUU1
 fQyiFxZdWodmSEA1J2AoTvshIpZ+xA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004



On 10/6/2025 2:48 PM, Vishnu Reddy wrote:
> When the ffmpeg decoder is running, the driver receives the
> V4L2_BUF_FLAG_KEYFRAME flag in the input buffer. The driver then forwards
> this flag information to the firmware. The firmware, in turn, copies the
> input buffer flags directly into the output buffer flags. Upon receiving
> the output buffer from the firmware, the driver observes that the buffer
> contains the HFI_BUFFERFLAG_DATACORRUPT flag. The root cause is that both
> V4L2_BUF_FLAG_KEYFRAME and HFI_BUFFERFLAG_DATACORRUPT are the same value.
> As a result, the driver incorrectly interprets the output frame as
> corrupted, even though the frame is actually valid. This misinterpretation
> causes the driver to report an error and skip good frames, leading to
> missing frames in the final video output and triggering ffmpeg's "corrupt
> decoded frame" error.
> 
> To resolve this issue, the input buffer flags should not be sent to the
> firmware during decoding, since the firmware does not require this
> information.
> 
> Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index e1788c266bb1..4de03f31eaf3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -282,7 +282,7 @@ static int iris_hfi_gen1_queue_input_buffer(struct iris_inst *inst, struct iris_
>  		com_ip_pkt.shdr.session_id = inst->session_id;
>  		com_ip_pkt.time_stamp_hi = upper_32_bits(buf->timestamp);
>  		com_ip_pkt.time_stamp_lo = lower_32_bits(buf->timestamp);
> -		com_ip_pkt.flags = buf->flags;
> +		com_ip_pkt.flags = 0;
>  		com_ip_pkt.mark_target = 0;
>  		com_ip_pkt.mark_data = 0;
>  		com_ip_pkt.offset = buf->data_offset;

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

