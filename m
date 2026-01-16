Return-Path: <linux-arm-msm+bounces-89360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02910D2F02F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 10:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4687130286C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 09:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1485935C1B9;
	Fri, 16 Jan 2026 09:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YwYnUwmZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e15mxFQY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EF631B832
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768556937; cv=none; b=ENLkoG6SgC8qYrQF3eJ/QQYy5sRERhU2n+HBo1KOZmhwQFY85yY9GpCSF9YvH5ZRoo6Zt/hLNzqy1PowaUKB2aZXTbVoV6Ttq4b3fI4f4F6u91N31JTy6GA36Wij+21ht61IkSRODSy/rDuElr808z41Jz5MSugR68xvM0HE2X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768556937; c=relaxed/simple;
	bh=Wb28Fxzx0vdeOOt5NzqzI299VhoUQKzG5Yi+H8cULyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mtHiCyAr/RiR/YQG3Hzb1Pl55Lut9GSQ7OvTIgHWKiSmEGIttHTLnqAdrUbcLP1aUTp09BeMi8b/qLva30I490+6DROF2XGzRL7NCT4BfuzERN1k53XS6ixQ69oa6uDJfhYB7AvOGEZ58jHzBkIIV1/+zim/VOvb2i8ymLAzgPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YwYnUwmZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e15mxFQY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G847Zr3075431
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RjvFL++nhrMVWK84y0LOF0JP/pwAYn7pogOAHRyRBYU=; b=YwYnUwmZdZh4VwSF
	zTBzWcVdZKE5zToDJKhCAjfCwDBYNFjSAR4ozUE4nbF7iTk1spsYF6SN/jgudC+c
	4DjaROplRMf+H8kc0//kMhtHIwds8icr11h9Ln4ZtpwhbKjT65eY1wmwv99LfUwV
	rqa+FoV29GngmkPJqteJ2npsjFtv3FWStYKgcPoVWB2rUlfaMuNj8BQVqNqAHqh2
	6+QS2Tx8cYrrGl4LcZueJLjx7Lpg7CnjTdVqlXkXXlsX9qbhTFgVUK0b5dXdwaKa
	RFNu2zkoACkrEr1luB9rwUEWhO0vGwBk/xq3jN8vwZJ3xBhfT4N0j+aIOf9aonZ0
	NPjLAw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq98jsph6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:48:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b6a8afb513so1899560eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 01:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768556933; x=1769161733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RjvFL++nhrMVWK84y0LOF0JP/pwAYn7pogOAHRyRBYU=;
        b=e15mxFQYnC0cT/eYKQgVw233QJ4ibhm89SjYXNi99vPbZoEF3tcZDxKtZUjF04Hpb+
         xKTiUrrLPN0SQtKpMZUZJYLyyd1nbLLooIQyyOqCcD55Jx4sZhOgRtHtioFre+PR6ZnK
         T6Qq9ZDEpliczAO6CR7My29iudeT+OUj/wucvLK0/2bAGhflB2mm0ZtVTeUc8Gt2O2Ur
         VBr8rO/mtPZv2qX3+VzNS9MSLB0AQW8tmOrPXPzXvjSXi+blp1f7pfADBfxHRq/LhbiS
         5CqQF1UkKuHGZvKYn1c564A9U4rtnegqa1l/rKYRuxzIB3KeCjeeY3jZq8W16gqbe/p6
         Ueaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768556933; x=1769161733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjvFL++nhrMVWK84y0LOF0JP/pwAYn7pogOAHRyRBYU=;
        b=jORAG3u+x0HQCWugBJ1/geYGjpkXg3AMvIX02kc/2yv6TafbbIuIH8uopXd6lB+N4V
         pD6LtURqhhLq03KRCEO7ACBaU0Pj9L9o/AmLeeshzeQ2tTravMRq7AIC/z1BwVjEZCp8
         15N6EPqrve+QuVlPjs9L4mO+Q56Kp215ilG65l/evji+j00kDlqGBU47U0I2VYbvxttL
         TmFpVonTf+ZTgQYK8LddjgP1VZ0R+CcVxvk2fZ+TEF6R2k3XICgbuItNirlYERFnbqHK
         j7yxuKMNbtCdQdeeeCMqIFreEuKD1L4vNQfX97gOSY0HWtBsEz9y3f919ltsgzsg/khb
         397g==
X-Forwarded-Encrypted: i=1; AJvYcCVSxAJz2+fsaHL8iXtf4itmGtSlQ4DLo7emy49p7G8uHRjIbTVgzn++u/htc3wMM0JHFDiZxG7KjX54MsxI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7UIDirCXw07Eay7oZHoBcW1Qnrtely6tdovh7DNvTWWst2GgF
	t/xz6astzTP7V8jJAWYTTX6jOqyE0FwnSkfrYKDVNfmeIKCUbVcSwo9U5mP3hjhW1a+cy9fs/8T
	KnyqOyrfCj+C9P1G3+qmQ7qV/ikXzri8Bt7T6sYrc+dz0ZCwHIhdfyakzzSGmTDGWEq5C
X-Gm-Gg: AY/fxX7oyaFhrrxIicRYpQt1/DBcXM9VWge5TqSLBd7XX7BCs8AjrvL5dY+X8ssnpSO
	8zEXxEOU4kE4r8ZeKn0l907NF/s+0xSJhFQAwOqteuXoVLnzmmsiSl4NeDFQvQQGlWwqcImxEmG
	KU+eSBcIVzAmS3+UuoBc//LYQ153cr8AnVbPLV7hEukZuuYtU4hWxYrdf9vpXcKD+xj+17eCmfu
	DDppIxA828GSs3prJtEJQqaWuEfRJWarBzFUw1R8v1Xh4yp7lBqfsq9vczBR2rsXx+wBAPZ6RBZ
	iLrGxfC9aMxxWzbOWrokhqIGyA1b0mJK7gSoZqDpVLNui9I706oXDMgUFCQZER35YYeZ308AMMv
	HnGZb8fTArDbP6ogkpWfC7qnaCS2lf6D6cUYDkZdfdqsrlIJYlMnDKs9pbMJI3amlxV8=
X-Received: by 2002:a05:7300:cd90:b0:2b0:5bce:2f44 with SMTP id 5a478bee46e88-2b6b46e80f3mr1513101eec.10.1768556933383;
        Fri, 16 Jan 2026 01:48:53 -0800 (PST)
X-Received: by 2002:a05:7300:cd90:b0:2b0:5bce:2f44 with SMTP id 5a478bee46e88-2b6b46e80f3mr1513084eec.10.1768556932773;
        Fri, 16 Jan 2026 01:48:52 -0800 (PST)
Received: from [10.110.106.226] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b364579csm1537393eec.23.2026.01.16.01.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:48:52 -0800 (PST)
Message-ID: <96472b7c-9288-4f81-9673-d91376189a18@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 17:48:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Fix SSR unable to wake up bug
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>
Cc: Shuai Zhang <quic_shuaz@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
References: <20251107033924.3707495-1-quic_shuaz@quicinc.com>
 <CAMRc=Mce4KU_zWzbmM=gNzHi4XOGQWdA_MTPBRt15GfnSX5Crg@mail.gmail.com>
 <212ec89d-0acd-4759-a793-3f25a5fbe778@oss.qualcomm.com>
 <CAMRc=MdoUvcMrMga6nNYt8d-o8P-r3M_xY_JHznP3ffmZv8vkQ@mail.gmail.com>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdoUvcMrMga6nNYt8d-o8P-r3M_xY_JHznP3ffmZv8vkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=asW/yCZV c=1 sm=1 tr=0 ts=696a0986 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=usUDIKvMo2Zw1yWlBjQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: nTSkiDOGY9WHkdxmQoLDHRXHA20qH7K-
X-Proofpoint-GUID: nTSkiDOGY9WHkdxmQoLDHRXHA20qH7K-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3MiBTYWx0ZWRfXz2N3+0nsw/sh
 QlGleWUAff63txnOepo9yZ8PB7X9IAZMV0z/hosuD/tiMKIE+chqH8BeryiwenI4yiimAbDfjRR
 bOBUOiiPvVb5Tx41KPNhQAF5NQ3VFQA8xKuGo3TVsDL6wCkCPndEBKByWvP5FsdR0gOnRyst4ob
 3iGtYvcDVu0oVnVGWS3oswdBLhIT1MeJzeeu4cWIxotElCMuBHokDJ3x6VgCTltl75E9Vyc8SvE
 PqdAFQBzcMZRLZPdEXWb0HTHrycEPwx20oly68+G2g6dVxF0Q6p9ZfGrZJZL/9bVpX7iGIMbEOn
 XkiS1ClxTwN+jPkorXcvv7tmxlfkOja3DHgEyO5TfIlviR/HB+b4PoGda7JH0QwEeQYAL9da/uU
 k8+yyk6DYKamJ47ZgoDmxuyVCqZFY0DoeFXmdnKZf9MYLpvbG9y8/y5rTuxF+EUKCzsKMkFJ6ba
 HIyt1G6KA4OXtn9pZgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160072

Hi Luiz, Marcel

On 1/16/2026 5:20 PM, Bartosz Golaszewski wrote:
> On Fri, Jan 16, 2026 at 9:37 AM Shuai Zhang
> <shuai.zhang@oss.qualcomm.com> wrote:
>> Hi Bartosz
>>
>> On 11/7/2025 11:37 PM, Bartosz Golaszewski wrote:
>>> On Fri, 7 Nov 2025 04:39:22 +0100, Shuai Zhang <quic_shuaz@quicinc.com> said:
>>>> This patch series fixes delayed hw_error handling during SSR.
>>>>
>>>> Patch 1 adds a wakeup to ensure hw_error is processed promptly after coredump collection.
>>>> Patch 2 corrects the timeout unit from jiffies to ms.
>>>>
>>>> Changes v3:
>>>> - patch2 add Fixes tag
>>>> - Link to v2
>>>>     https://lore.kernel.org/all/20251106140103.1406081-1-quic_shuaz@quicinc.com/
>>>>
>>>> Changes v2:
>>>> - Split timeout conversion into a separate patch.
>>>> - Clarified commit messages and added test case description.
>>>> - Link to v1
>>>>     https://lore.kernel.org/all/20251104112601.2670019-1-quic_shuaz@quicinc.com/
>>>>
>>>> Shuai Zhang (2):
>>>>     Bluetooth: qca: Fix delayed hw_error handling due to missing wakeup
>>>>       during SSR
>>>>     Bluetooth: hci_qca: Convert timeout from jiffies to ms
>>>>
>>>>    drivers/bluetooth/hci_qca.c | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> --
>>> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>    Just a gentle ping. This patch series has been Acked but I haven’t
>> seen it picked up by linux-next.
>>
>> Do you need anything else from me?
> I don't pick up bluetooth patches, Luiz or Marcel do.
>
> Thanks,
> Bartosz

Could you please help clarify this?


Thanks，

Shuai


