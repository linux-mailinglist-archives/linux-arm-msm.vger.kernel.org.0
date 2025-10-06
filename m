Return-Path: <linux-arm-msm+bounces-76074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B218EBBE47D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 16:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C14A3B5572
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 14:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DD72D46BD;
	Mon,  6 Oct 2025 14:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HqPRy82Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766202D3A94
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 14:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759759779; cv=none; b=aytmtOY7TiQmPIF6EP2nzicHseCsdcdsawGj/6yTm+TVCVe0X4/WFVduZuUgr277teTAxEj3RDOVJUl2b+zUfNN+fPh4yAP0P9ZRYYVLz5tuj6GmXTFe1EutWvTQvBZxtFQPUY64vSCSVdjgSumDTR16aCVpf4ClLhGH0du46rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759759779; c=relaxed/simple;
	bh=+Ac5cJDdDTJOQVETiuUSs4LHivS3FpAmbvBAbBep0jU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=suGth676naOwDqO6fGV3sP+LwxaXC7yrold/ORTAKCbup2TBeqdcbURSGkfFjNO/y9qiwiQJnTvNXh/C6WZSEnjRNuZx+HHCAgseBBU4SGPDsgtxDAU/WXxF0ZsX3rgjcp/0ajo++nIJ3A4tdn9B47BpbqmWKJW37B8uFrmr7Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HqPRy82Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5960ORD4007705
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 14:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GB29UCMLBPXo5eLdPjvIY/VLAFer3OBUfViSSQUTz/4=; b=HqPRy82QW9dvo6V9
	ZeLHR1a+pjiex41d81XSc+lXdIouV9OoeMLKggKrxaxBJsYRhMVD4EhnyluvKqa1
	e1mWUjSS2ixA7Al4vx5kR5g4UHaftia6Fqrrxcwx5EE/WwIe4Q/xtWQfJyoXyndl
	rpXhpa51BoKonI/WtZR8D39pVuFBU7QbGm0JJ7YnswydRT5vmi7PqMP45wc7SdHH
	tjyEWVcL60jVbqhe4mwkuiSPjSw6ppPrwhA/eglD5bk/EVAxQ9tqW6D52/SlC4B8
	PRtqHL4hJbuQnUXgYVuGsUgeZcQjywlM8TO4h652Zo7QBfEDtmxQ+qyeGksA6qut
	FOTPaw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1m0hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 14:09:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2698b5fbe5bso58022215ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 07:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759759777; x=1760364577;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GB29UCMLBPXo5eLdPjvIY/VLAFer3OBUfViSSQUTz/4=;
        b=eNEVLnT/uuxXbrdebR/QQq2JPjVcfuxotrLeDVS+qD6uM/tipnQVngGebYX+WgT986
         gEzsYaS289kJUWsoIs8OVGPlS8wtc9Iw5Yxx51b2vXBItF3J/8L8m2q0LqnDNQtVymbW
         pnpYDzxtOoNkerc1l6E3+6zhGbHuArNri5sFk77TvRuwmeoNP3XUKuZxJGYqjhPpsd30
         beWayeH/rz2zZi7TcVeB5PP54Sn+DDQqYmH37+6QToO8fKq6qRJmPrkrhgLGKgEXG66F
         IE+mtJjRStaefcte+Ugn9Zb4GSJNFoJSoEzIrS0AR31f/6DfCTMxkSXpumiu844GCyyT
         sUjw==
X-Forwarded-Encrypted: i=1; AJvYcCXpjIVoZcc+rl5/pm46iwwuobFCnl0UNxACQJ3V5W4tKhO6l/JAKn+QwsyvNPKR+TBx6D8ZMzgN9JeAzjFt@vger.kernel.org
X-Gm-Message-State: AOJu0YxZNTwyo/Ic/SqaVyJnvRV5miYr7+2kJDy1gbwKZXHrC9FQvT/0
	re6IAxCozUFIu0MA9hBhPBWgyj5PhyPTvwegT3AGzC7ijI1OudTAUyFU8mB8MRTYvMQfbvWUQot
	jKwe1XPOCvZmLrZ1BadrO1rAFSXCWGFt7nc840M0q4NkeOvdFkxKix6ee1tqQKKuSyxFU
X-Gm-Gg: ASbGncviBepK04vBlhiZ0KYENFyWw/h9BXInUsguvOagdvnLu3ZFOwM1hxPE2EICgWo
	KBBNDjybEOsy2EEwFHz0pRRPUYz0HdPmR1Wm9qcYy53pJGGGDq8KhIFTx3rBg37ydI4Et++GYlA
	VlTr5Vsc2dbArhtmyP/0+rm3sRQ51IPKaDsn2gv2waJFUl5oQ1DFI7IbaqDi9GDnk+9GcTf4d/Q
	lj2zLD/bj6zPG/xMFZbJ+mpC1sCzaheuFJ2yHE4wzdoJLjvlwCs5TZcLX6Ij2R2ySwEX424dZmO
	C7RaVdDhuaMuQRqfNa+CJxBaSAnnQLY3idBsHR1csnnigRJ+9FEf1acSssdAm4viu/YA1d/ExTv
	R/dw=
X-Received: by 2002:a17:902:ef09:b0:278:9051:8e9c with SMTP id d9443c01a7336-28e9a65bbe4mr151249515ad.42.1759759776717;
        Mon, 06 Oct 2025 07:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxq1GEAbYHAQEO8/Ijrp/7z7LdukF6tnpYf0+ClvsrQbBiRXSi+LJNN1E6SVrt66M4621L7w==
X-Received: by 2002:a17:902:ef09:b0:278:9051:8e9c with SMTP id d9443c01a7336-28e9a65bbe4mr151249005ad.42.1759759776277;
        Mon, 06 Oct 2025 07:09:36 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.253.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b8796sm134519245ad.77.2025.10.06.07.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 07:09:35 -0700 (PDT)
Message-ID: <fd9860aa-23c9-b223-2139-a2da93191410@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 19:39:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: iris: Fix ffmpeg corrupted frame error
Content-Language: en-US
To: Vishnu Reddy <quic_bvisredd@quicinc.com>,
        dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
        bod@kernel.org, mchehab@kernel.org, hverkuil@kernel.org,
        stefan.schmidt@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251006091819.2725617-1-quic_bvisredd@quicinc.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251006091819.2725617-1-quic_bvisredd@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 52uAgnSzQIREpDco8Zcy9nBvMzJaSNjQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfXxsG1L9HsEo40
 vzVxeE/AGoszjAGyUtVbI12TYruc+0yieV+P7hiKn1ouIgdYNfC5+6/unNY/UZ/AZwxRSENUt/Q
 QBeb1oGq9ajCk/SXHh5vVLim7RzRQThV6tHYgTKz5yWE+YjFo6p8GHyHiJfcsNAOWvJ+iTNBfa2
 ckM+hwaxcIIn8nyYE4xvqTDsYBjlFKSnUkD3bdbCG2kBrxh6G5S8q0kjZPN65hA9ujb4d3mat0K
 0yRE2mjMG7+wOD4juP7kYj46Ap1QAIz944JNAFx6bndTV+lQHxyUxO/OzKfhsOHWWDG4rBRFrlw
 ftb5AZ+R0m/4D0UVxQs4tVQGJVv7uJmtiocmn5ayfQxb9Cqc5E/XjaB5CJB9vRs2Tn81RPwpM+F
 A5upFe3OdlhFX0BnAaTiExLtdMFVSw==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e3cda1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=kO0dpjAoeuYzon0q5oXcQQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=kcjkJnMakA67_LZCmskA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 52uAgnSzQIREpDco8Zcy9nBvMzJaSNjQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027


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

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

