Return-Path: <linux-arm-msm+bounces-108914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHhmAraZDmpcAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:35:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7836C59F118
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E2C3304B8BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 05:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B809B2F8EB7;
	Thu, 21 May 2026 05:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jNMfJxW9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rca2qnQz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B4F27E045
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779341740; cv=none; b=FRjrZ+eKb7vILbs0xaurwBOE9nLRB13k3nycY9kyYP4Ry6LX0Z5+eymgJF0ddonaj+WzRA8MCfbm17o+zqSksBLdAxO1vNuM9JUzATAwDBwXdvgmPYk2Ui6wkEKyvwDcYKqg2nMdcMM62B9NPm3zaG08Tulh5aD3wwkDT8GcdVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779341740; c=relaxed/simple;
	bh=0atxgMq+szH5Ufv4SL8n5ZphmTuQpkgcylB475e3c0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sQGSHE4ypn6ubqjmYWKGXRNx0zJ054NS6Qox4lmv/AD3BBMo43ugoUYK5O1ceqiCDI/kBsAADTy3DzYLCDzGpwRJ6ONrAt2NSKW0Ngq7exQsIg10QUS/b7L4giTujLbTHO46KD2C0fRjXEh7M9eqXav+XqOgdQWpdZFcniulrAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jNMfJxW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rca2qnQz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KNNHVV963697
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0g/JhXVlwOR6OCAZJKqaxDubpWRdBAIJQr0EQvUGow=; b=jNMfJxW9xHBtQUxc
	aKaXEXMq2MFePFXaTmjFkPLcgIN/QTN7bjNQ7ZOV6ewmLKlWQhFFIInsh8Lj3DwP
	ujW/MtBwmc3rSXTAu5CeC/VSMySBaHOIA/Hth6xv7PtZF8OPbLsHdU2nnW4P7+KE
	If7z8jQe2Yvi9EZqb6V0ojRpszUvJQnDrk+gp8WmSSPnHb6gT57QKqXpiK2XfdhW
	XvkJtphpgblqsUkd3z/yiQ5AijpddtjZSLaQ9yMnDtTjCQAtx7SnQOCYYJlfQi3A
	tPswus286wprB8P4L1E2fVwwIQ47r/7glfDB/QM3eZu3X+STz0jQcyQaRrRox2CS
	c7nrOw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ejh36n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:35:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c827bda2e60so3327215a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 22:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779341737; x=1779946537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F0g/JhXVlwOR6OCAZJKqaxDubpWRdBAIJQr0EQvUGow=;
        b=Rca2qnQzquIa5lvSIY9IlPwhTMi8cKpktKnnNpvXcpDaM1/sJO5Ba6uNbjcPA1hZqy
         q1v3ir2MQYa67gBPfYQTsK65X2O0P/VPOpsL63LLZIBzcOm0Fsi0BpgaVUFnIgcLsjaD
         xxxmQq+RwRgTMWNsEKL9RQ14pTKWQpAGu/fiwIa16ouGHJzT69gP/JoiizOyrMrbw+Wn
         FL1YF4dRKTPqobJ3m6Irh3E+yJj9JT1TxxJnbKROSf99XMor3KlxnstypeyDy/xK9pLH
         YplNHNvrk1VreMgEJjBU9SBiYFeFuNwsVjdPIEaJ6pDfcGP0lwZyI5bWk4ndkgb6zzmW
         smVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779341737; x=1779946537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0g/JhXVlwOR6OCAZJKqaxDubpWRdBAIJQr0EQvUGow=;
        b=rJx7l480wcqwEwiUIJYH9Zq3FqJsSYdM9XrOMI63tFtsXvNy0JM0W/MPe5iEOxAN+R
         xNRvkmKBS8ejRHxn9/ELtxu9jlf2JM8GkmdMp9QwejmejOUXBAy/Qgj//YdkSDlIwRNK
         Ehag8kGn/A+oaynhWjcMKM3gqhT2624tVzmnBmGyrO4jVeIPy2mm0zapWZZp3cwM6sSD
         Y+onf0LKYeASg6orAHqGSg90PoDoRsuP0ENQ3CAmZ+yXWaPoUHYk1wqTrarkqOJqOx1r
         7lC3idjt3aj2f/EZJG7NGrVtqjXmPSSXV4/yr26IgUCPxUwR56KPP25y5D642BTcdgrM
         vQ8w==
X-Forwarded-Encrypted: i=1; AFNElJ+zZ+dkQV0Dp9o33m2hwcvzE7bNVbQnG9w7CZFc1KqCbR+HGy0UM0FHyByQP2TChmhIpqXaQvcq1DrwxkEM@vger.kernel.org
X-Gm-Message-State: AOJu0YxtmISkYmen7iFxT/75s/8lGshl2RTzZ4pMYDWOh/Od4rgcvamr
	hXZZz6Ap91+EvZth/I1UVz0UyUfy3x37fw+po57wVf5fWQszIxvIgcNmczr2wG0pCAMRo3+OGld
	SL7hjLzGT1A/OvWtLqrmlzUbjNXQq74v4uw94ZpM49V8+QPN+qlbBbLCu99fO8WG2Dbcp
X-Gm-Gg: Acq92OHyh+Hf4fP7G0CDLeZrfHYycf1tt1iqLx5u13oca7zr/JxKQ+3CH+c1BB+rBvA
	RK3iGbumt0qaTWadN3NzzfueUkQSY+rD8mGuIMXgrGs2larg0vL8bZFr7dR5/1qTO6/t2U51bDe
	rP83KVJCIcYrqjHVMf7ch95opYSWQpFqdV+/LMoT7nxZW9xU+kzZM7ZVZI/WuzioSNoPIM4IsXH
	Wrk1cdTuPMuThJKoGCVcs9xkZorD58uVHqwxwmtzwtI5vQGRG49K/8axvmOjOZXgTgz/TDQYn2M
	cgQW87TwF7Nd37johujvwe9Qnqm2RBOSUiSdwS6iJ6VOQdkHCL8HfG/adudRFbcylUEKmMvBOe2
	DxzC98CtgSGRwpZ83AteEdGUThvUR77uVhhJXNaoVFPEKeKQ6
X-Received: by 2002:a05:6a20:3d10:b0:3b2:92e0:f987 with SMTP id adf61e73a8af0-3b3085a9947mr1773930637.16.1779341736844;
        Wed, 20 May 2026 22:35:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d10:b0:3b2:92e0:f987 with SMTP id adf61e73a8af0-3b3085a9947mr1773893637.16.1779341736328;
        Wed, 20 May 2026 22:35:36 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82c4031662sm20680540a12.16.2026.05.20.22.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 22:35:35 -0700 (PDT)
Message-ID: <7bd4795a-4e65-4b23-9151-0540bbfeb5f6@oss.qualcomm.com>
Date: Thu, 21 May 2026 13:35:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Bluetooth: btusb: Allow firmware re-download when
 version matches
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260429121207.1306526-1-shuai.zhang@oss.qualcomm.com>
 <CABBYNZLP+rBrjhdKJLE7N47Bg-g4-6E3vS3yZXvMKwYQ2rMcUA@mail.gmail.com>
 <cf77b8bb-5427-4d0c-b212-51947704378a@oss.qualcomm.com>
 <CABBYNZJpW8=KtN9_G2QOp1YqD3ZJhWGVriyLBh7jUGRFEHPyYg@mail.gmail.com>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <CABBYNZJpW8=KtN9_G2QOp1YqD3ZJhWGVriyLBh7jUGRFEHPyYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QptuG1yd c=1 sm=1 tr=0 ts=6a0e99a9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ufI6BYMI3Tdet4GtgHAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA1MSBTYWx0ZWRfXwuDbsgeVHTLp
 PzBwgfHp4SgDXuLz0UmMfWyOzSsBpDTzXeTU/b+WxZst44//WkkUT6tfDDok12tT+ZZ0Hp2PFSs
 ajyRCVJXTkjRNj5EvGpYTOnJZDG6QzU2O7Ue3yPAjgLcJDP5pNmc8CIJxZD9XyY6F7Fd3W8XDi4
 VNp256CcYyq4IO55khTk9SlI9lBJX+CrW42Bi8LkTtYSOVmlDTaQzQJwEdMQp9H+bZdJoafoX9e
 FwnGpqa4mFZhn1U2OAqfBYV2PxOiguDjdS+DduLit/IeS9jTy6akAoZnlCk2IK0EbVmsqNEOjAy
 EdIRNDWkDOJBSSu8D7R7TRI0LNhTF7bFYhNdCYeT29/5fvvGzNVwH098K1qPzdWFc0VRGJfbYQb
 9A80LdeBKe1rY25lNf/cKOW8Cbzh1VV95BF3yLBgtBhujcGVhNCGXHF53l/aOix4yQtCRaSZxeP
 0S8KW73Pb7LvyOuBBPQ==
X-Proofpoint-GUID: YlborSt_HKbXASfxvt778nhhiDE-YJdX
X-Proofpoint-ORIG-GUID: YlborSt_HKbXASfxvt778nhhiDE-YJdX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210051
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-108914-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7836C59F118
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luiz

On 5/20/2026 8:45 PM, Luiz Augusto von Dentz wrote:
> Hi Shuai,
>
> On Wed, May 20, 2026 at 2:26 AM Shuai Zhang
> <shuai.zhang@oss.qualcomm.com> wrote:
>> Hi Luiz
>>
>> On 4/29/2026 11:17 PM, Luiz Augusto von Dentz wrote:
>>> Hi Shuai,
>>>
>>> On Wed, Apr 29, 2026 at 8:12 AM Shuai Zhang
>>> <shuai.zhang@oss.qualcomm.com> wrote:
>>>> The Bluetooth host decides whether to download firmware by reading the
>>>> controller firmware download completion flag and firmware version
>>>> information.
>>>>
>>>> If a USB error occurs during the firmware download process (for example
>>>> due to a USB disconnect), the download is aborted immediately. An
>>>> incomplete firmware transfer does not cause the controller to set the
>>>> download completion flag, but the firmware version information may be
>>>> updated at an early stage of the download process.
>>> Hold on, if the download has been aborted then the version should be
>>> reverted, or rather just update once the firmware loading is complete,
>>> so this indicates there is a bug somewhere that needs fixing, not
>>> worked around.
>>>
>>>> In this case, after USB reconnection, the host attempts to re-download
>>>> the firmware because the download completion flag is not set. However,
>>>> since the controller reports the same firmware version as the target
>>>> firmware, the download is skipped. This ultimately results in the
>>>> firmware not being properly updated on the controller.
>>>>
>>>> This change removes the restriction that skips firmware download when
>>>> the versions are equal. It covers scenarios where the USB connection
>>>> can be disconnected at any time and ensures that firmware download can
>>>> be retriggered after USB reconnection, allowing the Bluetooth firmware
>>>> to be correctly and completely updated.
>>>>
>>>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>>>> ---
>>>> Changes v2:
>>>> - Update code comments and commit message to reflect the correct logic.
>>>> - Align the commit title with upstream conventions.
>>>> - Link v1
>>>>     https://lore.kernel.org/all/20260108074353.1027877-1-shuai.zhang@oss.qualcomm.com/
>>>> ---
>>>>    drivers/bluetooth/btusb.c | 8 +++++++-
>>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
>>>> index 572091e60..70abbabea 100644
>>>> --- a/drivers/bluetooth/btusb.c
>>>> +++ b/drivers/bluetooth/btusb.c
>>>> @@ -3550,7 +3550,13 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
>>>>                       "firmware rome 0x%x build 0x%x",
>>>>                       rver_rom, rver_patch, ver_rom, ver_patch);
>>>>
>>>> -       if (rver_rom != ver_rom || rver_patch <= ver_patch) {
>>>> +       /* Allow rampatch when the patch version equals the firmware version.
>>>> +        * A firmware download may be aborted by a transient USB error (e.g.
>>>> +        * disconnect) after the controller updates version info but before
>>>> +        * completion.
>>>> +        * Allowing equal versions enables re-flashing during recovery.
>>>> +        */
>>>> +       if (rver_rom != ver_rom || rver_patch < ver_patch) {
>>> As I said above, this sounds more like a workaround. That said, I
>>> wonder why it would print an error if the version matches, it sounds
>>> to be that if the version matches it should just skip and consider it
>>> has been loaded already in case the actual problem is fixed by setting
>>> the new version only when loading has been completed.

 From my understanding, the current changes should already cover this case,

so no further modifications seem necessary. Please let me know if you 
see it differently.


  I will add a Fixes tag in the next revision.


>>>>                   bt_dev_err(hdev, "rampatch file version did not match with firmware");
>>>>                   err = -EINVAL;
>>>>                   goto done;
>>>> --
>>>> 2.34.1
>> Just checking if there are any updates on this
> I had the impression there would be more changes needed, if this not
> the case than let me know, also perhaps we should consider adding a
> Fixes tag since this might help users experiencing problem if they are
> dual booting or somehow got the wrong firmware to be loaded.
>
>> Thanks,
>>
>> Shuai
>>

Thanks,

Shuai

>
>

