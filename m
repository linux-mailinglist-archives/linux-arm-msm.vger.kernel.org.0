Return-Path: <linux-arm-msm+bounces-84683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6227CAD7DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 15:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C941304C9D6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 14:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994801EFFB4;
	Mon,  8 Dec 2025 14:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lZMgBPZg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FE03A1CD
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 14:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765205255; cv=none; b=QnUVoDHRQWMXk+B6pFQNk5T5ZBCH3iaz7/7HeMjW+JqVxIBefmREnGgVyOqKGmERbTwq7FZMetS/cFG42dyi3sVdxJWJRE5dxU60TVg7FDHJ9CHOe9ovC1akErJD5ufT9gb38b2q/eVYntbEkrucbpj7eihCESTjPCI+URipdFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765205255; c=relaxed/simple;
	bh=6YdCU+ZXqz4fmuwobDuOtOS8sF3SxRByPjestsT9vgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R2i8uRQ5B1VAYmbt7TK1yQKXbNeybW9iICkEnX4slcevXqW6bYiC0oVpCbZl92Mj7aR8QlYEsId7L8rU+wvUlFdDPMCBH/VXfq6LQNoADFy0DwrBnVEQLFKVsqiBzRYMBjGkpJUFOxHyepnD2ptF4Z+rUr1kdppe1njhHDmLN2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lZMgBPZg; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8843ebf2facso66859676d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 06:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765205252; x=1765810052; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Djl8rvrNTarTjqc7P3QXFkVH29nvnZ3byk5D9flUAb8=;
        b=lZMgBPZg3Nc578i4Ig2TA6mvRZb1APaflVKE7Twc0hubDNwy/rzyzi+aAt7lBLKs9f
         BDNdhnnCNqgYSxqZP/zD1e6vWKP3IVZaRRPlVlVvGg2kHmr4v/KuxoDFmGCtbfje1Izs
         PGEkERyCDaJDH8pUbTY2keAWlXCgLx8U6sR7K0DPipD626VgBOiox8tWvf1ZhGw086nk
         vskVJuoR2TI/Zgu1LyP7s+8YfmE+IonTV6tPhF2h474RR+lcQlNHhSWgDgt+0bkFvSg+
         DjH3THaVXPS1gE4zEQwd/+FpVeAjHvnS1H9og9EyHv4P3eO5OeQGxrMAW07znraVw0BQ
         c8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765205252; x=1765810052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Djl8rvrNTarTjqc7P3QXFkVH29nvnZ3byk5D9flUAb8=;
        b=i/Y0socE605Qces/g1xT9ojTvN9snMWMPdTokj9tcTYwJTFq/YCsRVKLc0cOpOiYKs
         g+k1KjKrW7L2JNrBTot/fXe0eIhQs4RU3XcFZohQXW+twmVzjxrTsInEQr4PPUI7cres
         S3D/VWOGrd9jL3Qt0OQmQg6kfPvEtYnmlBWKhIed1sBMMox6q4t4HK8P5m1O/3JXwf7T
         7lCITwl9BdQ0DrEsoT64ocGxw22gMmZOv9AIH79l35XjdXhv/qqWWuqWiSo1vcp4nCY4
         ox+EDCdSlMZ6PuvuZ+AmBPKYNk2yAZfqs5vo4BX1CS6M9vdYfzfz75EnConmN1JdyOnA
         6vXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+tAmvn8dIK+C1XcvxGrLXw6hIqR3FhwM3r1b8WTFgjQpjvhiMUmKUygHmGTOZTTGvo2u5legv/p158niZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzAZfMqqETVNSTsfSoWzU3sPNDTVu8qLQUNV89Y+lJ/QCg1HkDO
	qQvzGpjcLwSzgjgL/3epowhnL2yAB+J24b7AQRT/I53R1+RXA5EigB4VdJuaw0vrs35qQGQw35Y
	D6/WIQsaK5FLUe2ZdeA4lmPJaJAiHzI3voGRWcF7U22A6HCoVX9sf
X-Gm-Gg: ASbGncsGgwkGTTwC7Cg61DFFZo2mD6hAqNSEkkh3cpdwBIcXkInYcgqsz+Kqw+U3RDI
	HIcW9mZCQp69lsI6r1Q3gbuVZKG6P4OpUTQ1oYRDuwm909amzFk3cQ6iRDLFnsurZ8VeYAQy9Vj
	a1PkvQESTnchmuKQ6U+HXWy/kTcopgyxl4CZMJw+VqvVyayAf/rneFxnw6LcaeiP06vnjxJUbnj
	MMWjqBuunu5oeADE3Bv8c0G9N+CJmMxqFZm4MorpkjXWIlDQwBB/sWGfV4lokTgNnsp6qT/9LQq
	q7ebot7ojklHnGwuh7F8kA8PdqeP+SCO/sORCXnBkUsLIMGX2xdYmUAGiMA=
X-Google-Smtp-Source: AGHT+IH5SseQKoKB16I67ntJ67GG4BXBTKMzIYCCiw0CsG6rPQA3EtAxNow1MN/zkMLkl2Sb2mR0HkXWihB0+5jKCbY=
X-Received: by 2002:a05:622a:1355:b0:4ee:2420:4f7a with SMTP id
 d75a77b69052e-4f03fd73a6fmr125424381cf.2.1765205252514; Mon, 08 Dec 2025
 06:47:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com> <CAJ9a7VjWDBEwdmMf53geACBWGusC8BC3pJuOLETeecw24+N35Q@mail.gmail.com>
 <20251204103151.GK724103@e132581.arm.com> <CAJ9a7VjHHkkTz9XJqjdQ+11_XX9zXuY0ZcQzPtq=Zvi4CN__0A@mail.gmail.com>
 <20251205100432.GO724103@e132581.arm.com>
In-Reply-To: <20251205100432.GO724103@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Mon, 8 Dec 2025 14:47:21 +0000
X-Gm-Features: AQt7F2oAn2-nGLDKAafS-iz_tPYGSdBrMsxU5kNDu5FNNuxHPYo8oNtqnxE74P4
Message-ID: <CAJ9a7Vg9Efi-5eecfiUF82_Qq8Jg9imN5q1-VKYZoPVUxNpjhA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
To: Leo Yan <leo.yan@arm.com>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, quic_yingdeng@quicinc.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Mao Jinlong <quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hi Leo

On Fri, 5 Dec 2025 at 10:04, Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Mike,
>
> On Thu, Dec 04, 2025 at 04:17:35PM +0000, Mike Leach wrote:
>
> [...]
>
> > The tables in the patch are
> >
> >     [reg_type_array_index] = offset_address;
> >
> > e.g.
> >
> >   [INDEX_CTIINTACK]  = QCOM_CTIINTACK
> >
> > which resolves to
> >
> >  [1] = 0x020
> >
> > where index is constant for a given register type,
> >
> > As far as I can tell what you have suggested above is a table that is
> >
> >   [std_addr_offset] = qcom_addr_offset;
> >
> > e.g.
> >
> > [CTIINTACK]             = QCOM_CTIINTACK,
> >
> > which resolves to
> >
> > [0x10]  = 0x020
> >
> > which does not appear to work correctly?

Sorry - what I mean here is the contiguous array that appears to be in
the source, does not match the reality when compiled into memory - not
that it doesn't work programmatically.

> >
> > The registers are sparsely spread across the memory map, so a simple
> > mapping does not work, even if we divide the original offset by 4 to
> > create a register number.
>
> This should work.  Though the array is not filled for each item, but
> it will return back 0x20 when we access array[0x10], I don't see
> problem here.
>
> > The largest standard offset we have is ITTRIGIN = 0xEF8, so assuming
> > the compiler allows us to sparselly populate the array (which I think
> > it does, along with some padding), we end up with an array of at least
> > 0xEF8 elements, rather then the indexed 21?
>
> I tested locally and did not see the GCC complaint for this approach.
> And this is a global structure with about 16KiB (~4K items x

Which is precisely the issue - why use 16k bytes of space when a pair
of indexed tables will use 21 x 32bit locations per table -> 168 bytes
- 100x smaller!

This space matters little to high end server systems but is much more
important in smaller embedded systems.

Moreover the table + inline helper is more efficient at extracting the
correct offset value. The helper is a simple de-reference - whereas
the helper functions you suggest require the code to make the
comparison at every register access.
The "if qcom ..." may be contained in one place in the source code,
but is called and executed for every access.

Why add inefficiencies, either in footprint or execution?

Regards

Mike


> sizeof(u32)), we don't need to worry about scaling issue as it is
> shared by device instances.
>
> If you dislike this way, then a static function also can fulfill the
> same task, something like:
>
>     static noinline u32 cti_qcom_reg_off(u32 offset)
>     {
>             switch (offset) {
>             CTIINTACK: return QCOM_CTIINTACK;
>             CTIAPPSET: return QCOM_CTIAPPSET;
>             ...
>             default:
>                 WARN(1, "Unknown offset=%u\n", offset);
>                 return 0;
>             }
>
>             /* Should not run here, just for compiling */
>             return 0;
>     }
>
> Thanks,
> Leo



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

