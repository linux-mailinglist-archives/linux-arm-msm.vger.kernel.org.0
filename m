Return-Path: <linux-arm-msm+bounces-103225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIIbHNT83mlINQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 04:49:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF353FFD69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 04:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1956D30326D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 02:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922D1313E3F;
	Wed, 15 Apr 2026 02:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCWrYkCT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUFS0Xl5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217B83128C6
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 02:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776221391; cv=none; b=cyy7ev6O5FWlXT4LjT33IcbA6kti3F4EI+iLhIQF2AuJqLKkSwel16FX5UVYD9jNWwacY99N9YUBDAinOoWm2uYT/ICh1XMwlllWTkiP84A7fcwSUlklK/dsM/UBjb06DujJStSPAyE+RuwMwsZkfn3BuHk8o3fBL+/Ul1RTM/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776221391; c=relaxed/simple;
	bh=JFEi0VD48StKC6owki25ycmNF/t8sTADQ78yU90b22o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fm8iqQqETfa1U7SzC7rHkKTbyE2ko5m3Yfo7YFuuw11BvFE5HmQcLxyzQXFAaNqJj4qH22YS6vHExgi8gyUWk9FdcOkHERu/hPolI7tbqTDSA3C6VPvw9OGhPdoswOCg/b+CM68Frl14DI9xjSS2zSrOT16vrSnDRYstF+CTso0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCWrYkCT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUFS0Xl5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F2chpV029991
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 02:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4r/cAuIiAsQKjwiHb55odcavxKshbzULhKnHQ931Y8w=; b=mCWrYkCT8qk1NUkB
	bewW2VfbzffXXXquDehlKK6/SDL7mFZQH55DugkuLnFg64kT7XJoqxrYi0TYOrRE
	76GVArR9Cia4n1O+qSKmEzNhloTNDVRTfsj098jmpXPWiVWdVgqtjkiUzriPnBpd
	Eg5x24Sov0BJH/NQI0NHKv/j3VoDN8YQegEu4aNW+ZlJ+cnpdAViPlOcS0sSThyU
	H3io9liQVlYG4UCkDFpr2q6/oSDUGXTtmg5PdTpzx8hjK8XNnhNGOV164jkOdS9S
	YV/ZQLHttedaP03ZYkx2ECXAHvrkcy7lqlTlQpkO42nHddx0fY7wkcFC20UeA0r7
	WIGUWQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhkgmk1e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 02:49:49 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c21dbc9c1so11246636c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 19:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776221388; x=1776826188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4r/cAuIiAsQKjwiHb55odcavxKshbzULhKnHQ931Y8w=;
        b=hUFS0Xl5KD9YsELGNZrZuGnZ/mPAZHp7ENOtXFS+qPjgkS2zobuNoF7g/LaXAZOIDv
         lmAjkIaJ7SBdC7HLAedJIIYSfOiZ8t3CSugMLO1rYvADN3U1GebApnhXe/PxvL3/o7KQ
         ULS0bEuK8N1XFECRobhxcNqQQcTeuE9Od5pUVq8Pl76wyO+h5b82llXB+MJT/WTT3IbM
         KHdw5WSb0FxCWQXJigpOzXNhMBSYiuXTJiKJ4bABtaBRbqwggIrsYa8U/UquaTJpLgG8
         I6p46G3UxUb2TXVOFLofhoUiGBJqiGYs/Aspo8UUkK8pmvKrleBzzxXdoOd2GR8H/1So
         hE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776221388; x=1776826188;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4r/cAuIiAsQKjwiHb55odcavxKshbzULhKnHQ931Y8w=;
        b=l+ZjnAVzfEUW7xngc+bJFeD1gayuBfKK7g52bRYeummTbE2ihuEQ5xeL/eQDc2WQOO
         lRhnQe48G2zB+SvahfzVQ4B2h0SgkdkNdRH8z5QyQi1RhDeL0VZcT6MDqg7JtZtpH08m
         aZg1L9JtPAl6FDVbnTAb+2LHUOLcB1cDYd9JkpB/JMn7rA2yJn9L69mEqJeDqLww9/dk
         tHiVtFUU2DhSTDocfqIdPEzIpdQNwShXt/yQf4AK+YjbSIQd2XHXn1Rxnwhyp87cOGje
         RwKPJxQmBdWM8OG/KsfisipoCLIFitIcEAUWVBYWZKisQO9hs6ZKuBxku99qdPUmSQ7Y
         SthQ==
X-Forwarded-Encrypted: i=1; AFNElJ92Cf5pidfkDnO0tiWPtuGhGxme6AnnZ5RAYxLHK1jDnjyxm/qq8HTdMmn6u99jm2bduxz4uPMATJt2dfzg@vger.kernel.org
X-Gm-Message-State: AOJu0YyB3bjPd6fg1GW9XMn87WMGQbeOgPdWpP30yRIrGkszwKmzmkrv
	pJy6zbszI+WqnAiZnuSzge7ZEMsDpuj9c4a9NzssyLylfxCczL4Dzmu4Vd3lJFFCFz3Tw0DjZDI
	0yyGPjo85fqBNFLr7AX1legDgI3V1h/E48VuSSZs2MmpoMNiaEA9cptZ4dcJk7JmGPNpv
X-Gm-Gg: AeBDievEkMB8y+KZhn7zZArki0ug+1eEKfh1RLA7fAehUHuAqdWM0TCnt5VVx1RIiyC
	9O93dFTrdPfFlu/MqVS1Kky8I4MfQZ5ynbBtlJPlPaHV4GZDz7MMqmlpIBujoHDyKv60EwOiZ/m
	6066WJjO6o2CT5WZF7N4PFEAgSV8FJ7dbzohRGhO4Lvg7ovL50A/LstQTBe2uGsgdlt6Es2UfiF
	jsnnt64DdQzvwIEbgJDYpGID3OPhSkQJIdwUt0Q2fbaT3+gf/PMFnjdAHFFF1v/Uyfv4wKNxl8q
	QtICGRadGlc4bj2Tn7Vir3fB1R+ebrW82IkBaXLhNXEpk13oNuYSxHPaGaXSOO65gIbDEsVgwDq
	jpcmEFXQ20JX8qaEM15nxzYnwF6zXMG+/98SUHVkd6O5G7ssw
X-Received: by 2002:a05:7301:1017:b0:2c9:1943:e7ff with SMTP id 5a478bee46e88-2d587d80ee9mr13078019eec.10.1776221388006;
        Tue, 14 Apr 2026 19:49:48 -0700 (PDT)
X-Received: by 2002:a05:7301:1017:b0:2c9:1943:e7ff with SMTP id 5a478bee46e88-2d587d80ee9mr13078000eec.10.1776221387489;
        Tue, 14 Apr 2026 19:49:47 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c605883sm710270eec.10.2026.04.14.19.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 19:49:46 -0700 (PDT)
Message-ID: <e41ee37c-c93a-44c0-9168-79bf59550859@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 10:49:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] Bluetooth: hci_qca: Convert timeout from jiffies to ms
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, stable@vger.kernel.org,
        Paul Menzel <pmenzel@molgen.mpg.de>
References: <20260327082941.1396521-1-shuai.zhang@oss.qualcomm.com>
 <CABBYNZKY_-QgsenfU4hpyQ1+87rXDS13wFueN2nX6Wojy4BgHQ@mail.gmail.com>
 <f6a9419d-5e63-4c36-a7e9-aab6ac798703@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f6a9419d-5e63-4c36-a7e9-aab6ac798703@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDAyNCBTYWx0ZWRfX1oVvkgZfxCWu
 bsGVu0+4n57ZG//uwKCIJAdp9thckP1LkmpYLYrv7HQfnocgZWztNHNwMspRxkM5ufwx73mE8Zu
 A+RgkT5v7x/ldvnxRS5J0qaEdWF82JqdHIazSUV2/SdzlbhND5NOGxVot6WMxR7NyT84zKwhlFB
 PYHwz+2f1zMSrQ79KBTDxJ8v0Gyi9MEt/7dDmtEVeHAQ0d2AwJac/5Kfld7yg08KuHCzoUU+2zN
 J72nz8kpfySMjRhKy90ULKcRuueEJYPeL7fq6sOrctrxOYG4oRIv+OAqxjIAgZjhUkbmFjU7sWe
 hRAWw/nB1vT/UtCix3YpVayBaBHJXAT+V7hgJXejDWJcu/HxO+Cw5S5jwkxW9cpI0/gPMKTLFNe
 QSdUFa4oKR5TO5rBQveFfKJFxSFj3AKaiMvoQHs7MVXpEhECjiey22TnzjojOavIYUGi3PYfzEO
 FcZ66m7DiiMuEKfa11g==
X-Proofpoint-ORIG-GUID: _K1JK35Hzfe_dEz1YMll-8RXNrWaZqQj
X-Proofpoint-GUID: _K1JK35Hzfe_dEz1YMll-8RXNrWaZqQj
X-Authority-Analysis: v=2.4 cv=HJLz0Itv c=1 sm=1 tr=0 ts=69defccd cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=PU9PaiTs9atMpjuS6XkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=TjNXssC_j7lpFel5tvFf:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150024
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103225-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sashiko.dev:url,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0CF353FFD69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luiz

On 4/10/2026 4:56 PM, Shuai Zhang wrote:
> Hi Luiz
>
> On 3/28/2026 1:53 AM, Luiz Augusto von Dentz wrote:
>> Hi Shuai,
>>
>> On Fri, Mar 27, 2026 at 4:30 AM Shuai Zhang
>> <shuai.zhang@oss.qualcomm.com> wrote:
>>> From: Shuai Zhang <quic_shuaz@quicinc.com>
>>>
>>> Since the timer uses jiffies as its unit rather than ms, the timeout 
>>> value
>>> must be converted from ms to jiffies when configuring the timer. 
>>> Otherwise,
>>> the intended 8s timeout is incorrectly set to approximately 33s.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory 
>>> dump during SSR")
>>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>>> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
>>> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>> Changes v4:
>>> - add review-by signoff
>>> - Link to v3
>>> https://lore.kernel.org/all/20251107033924.3707495-1-quic_shuaz@quicinc.com/
>>>
>>> Changes v3:
>>> - add Fixes tag
>>> - Link to v2
>>> https://lore.kernel.org/all/20251106140103.1406081-1-quic_shuaz@quicinc.com/
>>>
>>> Changes v2:
>>> - Split timeout conversion into a separate patch.
>>> - Clarified commit messages and added test case description.
>>> - Link to v1
>>> https://lore.kernel.org/all/20251104112601.2670019-1-quic_shuaz@quicinc.com/
>>> ---
>>>
>>>   drivers/bluetooth/hci_qca.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>>> index 228a754a9..d66af13ab 100644
>>> --- a/drivers/bluetooth/hci_qca.c
>>> +++ b/drivers/bluetooth/hci_qca.c
>>> @@ -1607,7 +1607,7 @@ static void 
>>> qca_wait_for_dump_collection(struct hci_dev *hdev)
>>>          struct qca_data *qca = hu->priv;
>>>
>>>          wait_on_bit_timeout(&qca->flags, QCA_MEMDUMP_COLLECTION,
>>> -                           TASK_UNINTERRUPTIBLE, MEMDUMP_TIMEOUT_MS);
>>> +                           TASK_UNINTERRUPTIBLE, 
>>> msecs_to_jiffies(MEMDUMP_TIMEOUT_MS));
>>>
>>>          clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>>>   }
>>> -- 
>>> 2.34.1
>>>
>> https://sashiko.dev/#/patchset/20260327082941.1396521-1-shuai.zhang%40oss.qualcomm.com 
>>
>>
>> Comments seem valid to me.
>
>
> https://lore.kernel.org/all/20260410085202.4128000-1-shuai.zhang@oss.qualcomm.com/ 
>
>
> The wait will be woken up once the coredump collection is completed.
>
>

Please let me know if any additional information is needed.


> Thanks,
> Shuai
>

