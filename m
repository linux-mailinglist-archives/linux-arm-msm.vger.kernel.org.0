Return-Path: <linux-arm-msm+bounces-83931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D884C95F6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 08:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BCE434E063E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 07:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8075288517;
	Mon,  1 Dec 2025 07:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H5QykM5m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j5HO6nw+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F3C211A05
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 07:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764573033; cv=none; b=rDNGN8iK3qt7SStGgXnuQEwbrJV2S5GwK64GXBITjcimiwWOIptG2FsZMo5h43tLdW66/Mb3Htkyr9FJFJXvwIpHdjaYFSwfhKzdDNU1wMNkLAnA5UV/QT43PAi23C0YFgl2ixSTVmTyAbav3JtGu5ZhIepfcAIF4IpjOk1fzU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764573033; c=relaxed/simple;
	bh=sSBBbyl++1YBwkmWe6LW5w810DbS7G+CPeuRO/RI5cE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aDes9ktl5U4ZlpfGXA2Mjtt/gRnpixwCOIB6Xt1Rj6DTNFTUzVEhjxxhqMeYWss7bbfeE0TNqsgqUbvz4ho5FEYYl2Ot7WxWR7o9ZTrSW4Ik/Jl/fcz7wUxy8xxDIep9HgZy6bhQMjqHyGF3MWsXjvA9gtrWpP3v4htveKd7swA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H5QykM5m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j5HO6nw+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUMj1xp2987949
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 07:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UgTjOCXX+e8VXmI85ZYlya/qKEH2QA2cm5o0ia/m0y4=; b=H5QykM5mFA2aHvfI
	AxjU9wk/2NkVuTsZQr3dAaG4q11PTj4ne5JzK1QoNhz2hWpm2ufKjP9ugPIK4Dhi
	hN0GMTS1raMXuPBq/sTTHFdX/BqotZ4X6LD/zzvPVSepye3LPi4tUpC8qUqM0Mzl
	KoMNTs7OS44Vc556w5W7oWL6qeUIM3TW+LiCTeFcSA+O92Nr//eXWN+ifx3x8J4F
	BVUNKTb/W9a9IxxJhXwybrGWlOwXZ2dLO604cfy/cTnQyTj+W3+qmfIoBxcDyEtS
	0tKCE1n0DS9ftVJEm6caXpXHxvLGFBnNOy/BkpRb9BAsFjGTwjHVpQgTJamYwSbp
	h2+nww==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqrwsuscr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 07:10:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7be3d08f863so5501932b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 23:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764573030; x=1765177830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UgTjOCXX+e8VXmI85ZYlya/qKEH2QA2cm5o0ia/m0y4=;
        b=j5HO6nw+M8KyQtoWvD5uyhaSTz1KeapkjkcaYSmftTkWM9QhCKXQKmRr4S99pniHq1
         0zQbx+zAgdeWTeI+pINLzb4YmBq+oddUMOwlcijTw3DOfF269P60o7NSM9tu+OJBfKJe
         efNDp9Q7aACDq2eQMF903Kqq1SnqUliNtFuCExFjLX9HNhxXEZCR7b30mJa8i9m7M5bY
         AzCuKp3ha2ukG1IAX53cN6Hf5JmJuSEqiDuizZC4XF5G/EdY6skAlzlS/0QdpybERTZU
         9hdfkfYPr1yN+uSNKEj3RTXEpBona80nFNcyuutAHidabCTbmW+Q/6yuttl+BBQY8xRk
         ZxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764573030; x=1765177830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgTjOCXX+e8VXmI85ZYlya/qKEH2QA2cm5o0ia/m0y4=;
        b=p8wBXUik1All0eqbp80NvGHY89nMGIfBPGtR1H5u8Li6DLGzrSlkNZePOG3o9iJcZo
         8irpqlWAHw5qZfls2NDSByW4Q39N+rNj8wBKsTWnCuXgQyME+o7lbpFC7RakDZCiPYSS
         3W9X2f8zUJf7Z1z/SDLXbaLpbYf8xnK5XZJg9FLdDbuu6zbG7sklGNlfWtfjIzJo0nbN
         w4OT8VckGTOP5apiTgqAERjnaC95Q0uMgOVE3VlHWMl6KyXl70nGzWSuJbAXeYomDrc9
         xzmiQGqTHxrcLv1Cd8iW9BHC48aj6zDfX9ytF/cqXMGmHW4Gi/jeUJPlq2QftXklLaGU
         IhkA==
X-Forwarded-Encrypted: i=1; AJvYcCVdWC2hsnpESFcRAD140bc/5mC06YsGdg/OOCvVsMzN3hoZfaWEjhAPkwhawVqV1OlIKfDmY9IEhm009dD9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/6aktYD+v9dDTDw/z58EJfAInj3twYIgiWuoKjKVtO7TRnmRG
	DTtvmSnD+ZdgXf4Jp92EYyrA74tEvWSQjwLWUPwHvtKwS2MkqdzYfmVgKRTmH2SgLxrHeeLpdQP
	5FoMx/tHnFElS0jpQsOrX2up0A4+UIo+Z+TTMx96Ojaf4+0wFRiEteXGxQLSg7DWHVPYI
X-Gm-Gg: ASbGncsJQuiVaPqtQ/J9TLd5RF6yVq0bCS/TD4ANvBe8kdwbUp7gwprtBU8X7HpGEgm
	4PRfvLVQ81Qnnq70TqyrqZJUqrOPybb+3IR0APm3j1KpL6cb4mYeIZOZU4pD4q7DOk7ilDlDuMZ
	ZjMQc3dd5A/LBhZP/jzLJUsEwhscC+2y4CebDAoQQRocYbzZXTbOeV2qMd65bwhD5HDqlO59TKZ
	NUGiZ4fejyQQ7jpYZYXQCGFeqYjBYR3keMI2IB2K5oxRTVwAwxNE7W6DqwQrLZrLMANNZsxbYrQ
	j8/BOOeo3H0H1c8flC0CON3TSiAdTBs9oKifX8q9Lqxwtx3ste29EUK7t+QrFOMTyqtJuMFmgKv
	GfKjDKVU7TztHSzpJad4jabPU3kV3Gw9mrHoo
X-Received: by 2002:a05:6a20:734d:b0:361:2fe5:51a3 with SMTP id adf61e73a8af0-3614ed92c1fmr41038436637.39.1764573030024;
        Sun, 30 Nov 2025 23:10:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrptRQyAkHikm171nkoxQ9NnD4KJj6uVeHmYE8vhPKAxR6lljfsA35EC9TrUvhWUkTbvZzrw==
X-Received: by 2002:a05:6a20:734d:b0:361:2fe5:51a3 with SMTP id adf61e73a8af0-3614ed92c1fmr41038411637.39.1764573029592;
        Sun, 30 Nov 2025 23:10:29 -0800 (PST)
Received: from [10.218.23.240] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f175742sm12378644b3a.49.2025.11.30.23.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Nov 2025 23:10:29 -0800 (PST)
Message-ID: <04d8f7e1-c716-44a2-a32f-3d124d15d011@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 12:40:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: qcom: q6dsp-lpass-ports: Add support for
 multiple sampling rates
To: Mark Brown <broonie@kernel.org>, Ravi.Hothi.ravi.hothi@oss.qualcomm.com
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20251118100203.2751955-1-ravi.hothi@oss.qualcomm.com>
 <20251118100203.2751955-2-ravi.hothi@oss.qualcomm.com>
 <be7ade15-4c1e-4226-ae0a-cd58a2b9f07b@sirena.org.uk>
Content-Language: en-US
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <be7ade15-4c1e-4226-ae0a-cd58a2b9f07b@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA1NyBTYWx0ZWRfX402UmiLbK2by
 uyErOEbGwz6FnX7FFe4UmcTXo3JzDGq1aesmF+I+QnZy+7n3zYegDSfNahmk9VFuNBJwpeRoUOA
 ieTdK+hgBt2jvQwDY0PuGdltahqvZny66/SUVi6gBruAZMuQYYFDh7MNCbBKkObbDj3PJK4M3M6
 TUpboxBQBNwhdBn5YPa08k+MvF+n27o9pqanbV72pCoJbEcg7a++XBmt7eln3mMHqfS8kErruOD
 Posepl1G4PEMgt7FvUSYKVAJekOO0hzJciolgLfbJWyg9xc80YpMEQHrhB9cAm8hTPOyGEJAQwh
 7lZ2YiMjy6SDEh2pqo5kTq1ujbanjR5uLM7KZA434VQMAcmiDlbvLB7rCKGDklH3qSGR8IsiUqP
 LN/UtrvqFG//f/RGdbkOepVaK491HQ==
X-Proofpoint-ORIG-GUID: A4P3GW0fCacXsA4HzejamDAKBb0El3OK
X-Authority-Analysis: v=2.4 cv=WONyn3sR c=1 sm=1 tr=0 ts=692d3f66 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EnvgKWhcHj285NneV7sA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: A4P3GW0fCacXsA4HzejamDAKBb0El3OK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010057



On 11/19/2025 4:33 AM, Mark Brown wrote:
> On Tue, Nov 18, 2025 at 03:32:02PM +0530, Ravi.Hothi.ravi.hothi@oss.qualcomm.com wrote:
>> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>>
>> Extend the q6dsp-lpass-ports driver to support a wider range of sampling
>> rates, from 8000 Hz to 192000 Hz. This improves compatibility with
>> diverse audio hardware and enables better flexibility for audio stream
>> configurations.
> 
> This just updates the constraints, it doesn't change the actual code at
> all...

Ack,
Will update proper commit Description.

Thanks,
Ravi Hothi

