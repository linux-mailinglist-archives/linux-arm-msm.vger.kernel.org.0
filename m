Return-Path: <linux-arm-msm+bounces-50188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE06A4DF91
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 14:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5214C7A98C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 13:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21A92046A0;
	Tue,  4 Mar 2025 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tDN1yHwo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB48204697
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 13:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741095921; cv=none; b=rp0ZNrWDuGdZiGMAQHhG4P8wU3g3kBHYgLlMC767btkIaKDfwLg702aziBer22b2+I0jAeZCTBG8Zx4nBmNOaxddbAWTRaLpxqewhnS9D5MhXACWX8meLvA1KlvkVXno1/1PlXJr3p0+9iQlHy8SWhsm27ljD848EN/VG8BR+Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741095921; c=relaxed/simple;
	bh=NqK0lDxLELOL9DD+GeZsCiZ5LA3cKDL5a44tbt5qZtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qR899gXBji7VBkfWo3A0VXeNiww2sXgaZKY75K1cfFWXnWRxEsbzcyfNDPTvWI7Swl45XZ4hEWan0ErVQea+aqG7zfx4gyW6xDmqVa/JpUUV5g5SqljN8f9O+RGQAdZKHTwHIiHV46i8Nw4A1gQJZRQULhn7MjlalHQ3ApUJevU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tDN1yHwo; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-390e6ac844fso4963762f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 05:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741095918; x=1741700718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jtRRg4J7QV1jyEFxXJ9yQG1POl4I6geC1f76q6WuMIM=;
        b=tDN1yHwodjOz4V3TRaZu7iziYe2aMoFtxsUtCyMhRwPJNDTehta4eM8HZJhUpLmyAt
         qhbDdH/VrB4MYIV/Z99sMCVaaFF2iZLgEWWAuP8+B1K9Jc8uOCYmokoyiLqcLl7C3RLs
         Mab+JuebmUNp/JLd8S2mbpTiPiJJuQcIjxY/QIlOugVZFCzOKgDdabxmEoAKUEsakHW2
         lY/J+muA+GcXtLvoipL9knf62ZNEF7oifZqmqj9JwhyspGDXq8Twusj0dZE+l+L80Tnn
         HAFwbLvqqoL24nBma7S6eVVHq1IO1OEkHBHjsY0GIsll/AIeH6cjw2LivZ6ONaCcI6u+
         muWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741095918; x=1741700718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jtRRg4J7QV1jyEFxXJ9yQG1POl4I6geC1f76q6WuMIM=;
        b=vaELBpTzvqadx4jvtXNO3WmHiv0AVfyN28OcV7jgn9bE2kZZmeSseTzERv13j7vsie
         3g69ANc1MoioL7Iz21DKb4KsfTbVUmud4rpqILiWfVBelHqpHu2DSiEgzPRLR0jzML8V
         YJNvELIF8ovcnXxlnjTDH/qvg6VeNebFc5UGeP1AQtNdC2pk/13f996uw9xvRS/qwBZB
         OgQYG2ofW5ZwJcFmqtldjmL2dkyYue0g5qAgXbq1t2p3r3nmwZafFfFdKc3HcAQYCgaN
         v0Yz+ABuEjv+AMxBNbsOMaNzx1ivK+WzGiCVT1hT7UFgP9ivEHTXAYvs6jp6/vrmwM6W
         aCXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUulW815W0vBi53qIaIJzIHx7r2z4CMK46HxRk4rGOo0lhLzFaFPxd13obJuefQB17/WVG8X719TK0O5hfx@vger.kernel.org
X-Gm-Message-State: AOJu0YyDzCGFJTmtdTEiutrDdnZXoJPLJv6fePkyEZOTojzHyL6F97GE
	kSea5WebKJQB7eA1VZ+ZH4Qtb5GAwRcyO79VSYyNtICH2n6p/lwFLStgEtIs5cjapnwKmG196Gj
	Z
X-Gm-Gg: ASbGncurQp+RmGlp0nAxuiW/oKAHQVBC/P8Mi1gHFS4wJQHA6ARJ1eUzVJ8C2sbVldg
	m0igbTfxSr+4YtfrOC/rwBq/lMXMNPNqK83g09Ea5+xN2lwVAeSXaSuzdJL+O4hvHqNT6lbvnev
	ld5EoDyr9D3wdE7SdFW7si4RdXh6x4aeK22os22UBPy043BWZ0W1T4+7aH6QvMrVL/Mr29PYfWT
	4KLqIAwkx5GA1Ldi8Htngduz25Jfz9t498AhMA9PaSyFeTOFLwiBrTG2AaH/dERb0vm7IO+S0Il
	6513knjZNYLjh3ZZzzNZIX4M30mN0yOzcuhiQriDMvL1QdNfGKbsYCXntVmxY2UU8yhbdqaZr/P
	Fsva0XKPEXA==
X-Google-Smtp-Source: AGHT+IGJ4dtiZRMJMOnqPeHzryVAMSS7yvTZyuTJnVR+H4eCzXwrKiCtheWRCRn+0WfWFlydM7tKCA==
X-Received: by 2002:a05:6000:1868:b0:390:de58:d7fe with SMTP id ffacd0b85a97d-390eca40e2bmr15866381f8f.51.1741095918174;
        Tue, 04 Mar 2025 05:45:18 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485d8e4sm17414305f8f.85.2025.03.04.05.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 05:45:17 -0800 (PST)
Message-ID: <79691e26-cddb-47d2-9112-deae3f9aaee6@linaro.org>
Date: Tue, 4 Mar 2025 13:45:17 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: venus: fix OOB read issue due to double
 read
To: Vedang Nagar <quic_vnagar@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250215-venus-security-fixes-v2-0-cfc7e4b87168@quicinc.com>
 <20250215-venus-security-fixes-v2-1-cfc7e4b87168@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250215-venus-security-fixes-v2-1-cfc7e4b87168@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/02/2025 17:19, Vedang Nagar wrote:
> During message queue read, the address is being read twice
> from the shared memory. The first read is validated against
> the size of the packet, however the second read is not
> being validated. Therefore, it's possible for firmware to
> modify the value to a bigger invalid value which can lead
> to OOB read access issue while reading the packet.
> Added fix to reupdate the size of the packet which was
> read for the first time.
> 
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index f9437b6412b91c2483670a2b11f4fd43f3206404..c124db8ac79d18f32289a690ee82145dc93daee6 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -298,6 +298,7 @@ static int venus_read_queue(struct venus_hfi_device *hdev,
>   			memcpy(pkt, rd_ptr, len);
>   			memcpy(pkt + len, queue->qmem.kva, new_rd_idx << 2);
>   		}
> +		*(u32 *)pkt = dwords << 2;
>   	} else {
>   		/* bad packet received, dropping */
>   		new_rd_idx = qhdr->write_idx;
> 

This is confusing - where is the read

Your previous code

https://lore.kernel.org/lkml/20250104-venus-security-fixes-v1-1-9d0dd4594cb4@quicinc.com/

memcpy(pkt, (u32 *)(queue->qmem.kva + (rd_idx << 2)), sizeof(u32));

V1 then would have been:

if (new_rd_idx < qsize) {
     memcpy(pkt, rd_ptr, dwords << 2);
} else {
     size_t len;

     new_rd_idx -= qsize;
     len = (dwords - new_rd_idx) << 2;
     memcpy(pkt, rd_ptr, len);
     memcpy(pkt + len, queue->qmem.kva, new_rd_idx << 2);
}

+ memcpy(pkt, (u32 *)(queue->qmem.kva + (rd_idx << 2)), sizeof(u32));

V2 proposed:

if (new_rd_idx < qsize) {
     memcpy(pkt, rd_ptr, dwords << 2);
} else {
     size_t len;

     new_rd_idx -= qsize;
     len = (dwords - new_rd_idx) << 2;
     memcpy(pkt, rd_ptr, len);
     memcpy(pkt + len, queue->qmem.kva, new_rd_idx << 2);
}

+ *(u32 *)pkt = dwords << 2;

My comment wasn't about use of memcpy() it was about why we are doing this.

For example if new_rd_idx < qsize is true then we literally do

a) memcpy(pkt, rd_ptr, dwords << 2);
b) *(u32 *)pkt = dwords << 2;

and the question is why ? That is an unambiguous cast of pkt to the 
value of dwords << 2;

What is the scope of how the data can change from a to b ?

And why is the data considered potentially invalid @ the memcpy() but 
valid subsequent the cast ?

Assuming rd_ptr contains the length of dwords << 2 to begin with in the 
first 4 bytes - why is it necessary to make _really_ _really_ sure by 
restuffing the data ?

For example if *(u32 *)rd_ptr != dwords << 2 - why shouldn't we just 
throw the whole frame away as containing junk data ?

---
bod

