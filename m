Return-Path: <linux-arm-msm+bounces-94978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDG7GPWupWleEQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 16:38:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 019541DBFA3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 16:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 995A83069AC7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 15:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7467233DEF7;
	Mon,  2 Mar 2026 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J4YvnBA4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AzVkZS5H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153A240149B
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 15:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772465327; cv=pass; b=NxR5B2tPxXtwuigu1bzJNStIQA7gtDkqakD4D+HRTgzWkgn8bSwn1AUNmkqN2pqtHjgwJ+4P74ipHO+knH1d6RgX3PWsPGv2hN5Iee/k8vzl6BPNyUBJO4vYaDjsuBof56CwHUaoxGhwp0k01PTovCzpuYH0IdHjfhPPLwRrGD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772465327; c=relaxed/simple;
	bh=yMjWEEG4IHO1+cAeBpZBERLu1y3K1V6SSSf2AK2CnjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohKJyqAjDxS7/H5slIoAwF6SSwcfSAscCbHgm+IHOOeGZZiD6/Sd//NIuOPiV4QjOFJr2k4aJYH5cVi5SKLItzVLjPmyjQG+nk4e1xLtphV5kBxsSRgeTimXQomqzacJ4MTE8d3jC/t9uyEqVfsGb8X1hxtdG7oXs+an65Lu5MU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J4YvnBA4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AzVkZS5H; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622Chr2i2504783
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 15:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pc7MDL0s135+gvrNSq0u9k8kGog5y1IXbAhWPHoK1iw=; b=J4YvnBA4AR7UmtRg
	/y8KqL/5r6bMY0K8/nHnaq1kkh0Ycz9T/7MyhpRzZuzenF4KGc1insRyvjtUWJ7R
	tyQ/0/21v6X5rbuhf1eMNu2tnWPmD/1iNcyq/YeI2dggY7v9COp/qFrWv8DNL5wS
	awaaOKBPRhjtAcekY5j1oRoqhA+n5oULHZQDIpjhfdlndfxumj60UZa7JOo/V97G
	fvif7CpmCnuvNm4D04ep0CMgVuBoXKT1eWAlv04VGCpF3gTp9FEP78pr8vg5Pw9y
	CzR45/EnsGqYGRUUytBGmZYfo2imql32/Bs2xPokMKZP/y62fQq4qg8r/QoGKs9b
	srlYmA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5hesua8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 15:28:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-503342386a8so365164831cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 07:28:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772465324; cv=none;
        d=google.com; s=arc-20240605;
        b=LZ8i1G425f9lYU1JrdVENmcSc8r3hQ3uzhQvNgQXwjyRw3BzdPYS13bL+mr+VKvCBS
         KcjsD7kSu6nwoqzem86Uv7rGyyuAu8X8f/2KxxYKVS39hXMdbAq6BjDRXuJTK4eYxf/k
         J66HWG6Uwp00s56LXsq+EQGGodx4mWLF/VJ1pYT1uHjB/YAnwqsGhlASygRMBM/aSS9S
         6C/AP8KlSGEkX2FLI/zB8hD9fsLWOjIn0nNgDXK8Dz6JNy4xNbcJozJ5oLeNrSPxMpBj
         4fuiVfrmDxURfD5XJRiMdKUYDAgdCvSEQnWfRrtcsNm589PWbg7Dy0dmLH0CGKABPuCu
         9/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pc7MDL0s135+gvrNSq0u9k8kGog5y1IXbAhWPHoK1iw=;
        fh=ZfqdNm70wkGT5gxaPG/L/QapctaBDhXgIMF5gDZGV/4=;
        b=Vfzk8+z5SZLOyexal6HMBnSq7u5Rd1ztp1JfZXX3a1WnF58InzD02Y4FQgGXxZP+9J
         G35gkiAWBflR+BQuYZK4qv/556z6d8Ha4IernYvNY3+dGWwpmsP9tKr2SkCOE2y/bXIs
         yJvpDRi+DCfA6nqHVfTR2qe9L2BNJYowOToAc3X0oidp+3cuC/uSsOgeUirsA3nwpYYX
         KW15uhGJPdOQrtimhd79GHMwZx4nGgZf5rWjYSa/Iu6RN38kSrO7Yx149wxLIcVW24mp
         UMXk6SAsp7cmubZ6kh6FcafBDzXQJ9SoJIEQCo/ULeP0SjKT5aL3fC/lPVAa0QazulXY
         3JLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772465324; x=1773070124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pc7MDL0s135+gvrNSq0u9k8kGog5y1IXbAhWPHoK1iw=;
        b=AzVkZS5Hlmi7yOR9UO+zRjg1i7MAnW/sSfkS4QjpCQWyx4Q2Fxr6nd6RtZXOzI9uvW
         8FmhhCMxzqRt20zZDF0IKg1S2tlqdX8OLUCR7Rt7eCx/lOzi6WisRVLQc+zwAxs0D+Kc
         wh0ho1uyz43D9sQYFeQyOn0VwfvZTtqsHeBpXiMgnvolvsbfJ1DcSoJk8JyFVJ0Z7g4K
         Q2llAiSRs6xPMx/fSyuLnPFOodsIOLjVQFBZ2lxVYucNKQXZpKmm4G9hVEPMxn+I5mhf
         HDL+ZY8g+G4Rofkr0f0D3GUhhbbAqHqRNJSqZkAWTtftEswM9t0GWUp3wVvidbj6psy8
         +v7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772465324; x=1773070124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pc7MDL0s135+gvrNSq0u9k8kGog5y1IXbAhWPHoK1iw=;
        b=pCMtmjYkfZRN4MFRcMc2HIae4zCF0u8kC+ncGexd0RpUdh0WaVYbgko9DfmBoDJxKa
         hb5KiFzhz3j2c00e6W6WoKOh01goHRAhf48r/Fq45Yq3yY08tAjjVSZHzqdpag8f54m5
         tcA6fFjLnzsJ9Hh8iI9OC3B0Xldf4OxKmNq27r6etf308eF62MmmXYHPeEfO2KGq+kxE
         VSlRq5uNsFzbHN57FWiqWUUF/JBA7VU8/pF5M9y6srYpXBLM7nhzlkwS2Tkeimy0NhsB
         FkVQ7XRpcFIAOat+5reVP6s8B5/gL7hv2BSCiJGmVhLc6yGGYMUm5JW+wRGdm3BR5hxR
         NG9w==
X-Forwarded-Encrypted: i=1; AJvYcCVJlTPmZepyRLW4LkVawr3zWN0EEvjkFDSXGWqo4DobcAnE+d6pW4opi3xmVhZNkcRp786Xjp6f8q/eGPnM@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs+WOkoJAzuHFyXHbgTJaogexZP5DQYfl/JAR/m8eQuBlFgqTi
	0ytR/pknK4D5G0GMELKtX1/0++vBQxBjIa+9T7f5nJmse+iiCiUpFlS3y4HpeKrSTf/lo2GkZqB
	4J5t1JY2+aAzzTXi26VnyZNk1gBbG1my8a7T/vVsAjZ+kbGc697+RFxm8YLQmh72QsPScE0Wg2w
	qqnVDydcerhLBuE+UlTemFYjCjVk36Sh7l3UDI/jukzrE=
X-Gm-Gg: ATEYQzxmkwLPJsjUksDRKKgFBNfNIHGVt6KascVl/BKPMZGXeJRW8Ro1DyLu4UaCLpA
	odCEZRsWmFkR4+JfNhI6adeek9MZP3iS77qKAXVKrfEYHV7xhSTOEIpDGzhVZiA3RniYp1LLNuK
	DDBGnWQnB/H/joNXIau5g+FS9OBeffhFYKRpVA8ixiNITQPtd2RMB6lZI64A6wzHI1uEY8Zgi3A
	Na3J3MaaE+jMKucsM00jGBgJZ3K7of1yxawKGRH
X-Received: by 2002:a05:622a:486:b0:4ff:4a7c:da11 with SMTP id d75a77b69052e-50752739330mr163588201cf.11.1772465324282;
        Mon, 02 Mar 2026 07:28:44 -0800 (PST)
X-Received: by 2002:a05:622a:486:b0:4ff:4a7c:da11 with SMTP id
 d75a77b69052e-50752739330mr163587741cf.11.1772465323792; Mon, 02 Mar 2026
 07:28:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226100444.857406-1-loic.poulain@oss.qualcomm.com> <1aa1bf9a-ee4c-40a6-bcd0-cd3866415663@oss.qualcomm.com>
In-Reply-To: <1aa1bf9a-ee4c-40a6-bcd0-cd3866415663@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 16:28:32 +0100
X-Gm-Features: AaiRm53gpTM07e2mB81oJ3O-Al5PASPZ_sg3Ig_wFpUqVR7CkSCnSD5ER6PgIp0
Message-ID: <CAFEp6-0Pe7t5q11K9fAFkbUEuLOmsBp6rE4FFvW6o99yuLqS=Q@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Populate media hw_revision from CAMSS resources
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a5acad cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=wzL84NikVdi8kru7dWMA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: UqdP_G8mlmtGIvdSm2USRciUrutcdAe-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyOSBTYWx0ZWRfX5IFGxK0GAcHn
 fJgqXfhQEmEHNhBkP1Nyq0lTg8B90Q45nPnn6eTayK+Av5PvwdO+mufZnUhb1GT6saOX+lwmq20
 9i9fiTqImveEitoob9imqYEsQz3Oa2qraEgkbwlQiBmpQ2HtgVeftcTYWgpwLot1RL/iED0OHTA
 Oq20wFO2+lPwW6TTNzsmMQBXEWRHGsJDifUUlgbFZTvl3sWpFxIXGYL9qPQZl+gmjcrySjulGUx
 HePiiVHqT30nMO2uSQLWqg1jVkFrOVljF24c+7t6o6S3jDkTha5a9CgXfbilUniPO2T7RB77ph0
 tQHZeti3vXteYwRPJgIcp2iqqDyVz8+xAe07Juc7GoeJqDXmncYjNlr7izG6hD6/2QECwlnxf8Q
 kenG333m0E/0aa33WiYgcLrakH3ojAB9Wfnvxswc38MpRyhjJNBktgjcwn0ZI0MFzGbkyljtgji
 gEL07Kzp1TjFUDVtfaQ==
X-Proofpoint-ORIG-GUID: UqdP_G8mlmtGIvdSm2USRciUrutcdAe-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020129
X-Rspamd-Queue-Id: 019541DBFA3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94978-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim]
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 2:50=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/26/26 11:04 AM, Loic Poulain wrote:
> > Set media_dev.hw_revision using the CAMSS resource version so that
> > user space can query the hardware revision through the media
> > controller. This can help identify the exact platform variant and
> > adapt behavior accordingly, for example, allowing libcamera to apply
> > quirks or enable features that cannot be discovered through standard
> > V4L2 or media-controller APIs.
> >
> > Reported media info on Agatti/CM2290:
> > Media Driver Info:
> >         Driver name      : qcom-camss
> >         Model            : Qualcomm Camera Subsystem
> >         Serial           :
> >         Bus info         : platform:5c11000.camss
> >         Media version    : 6.19.0
> >         Hardware revision: 0x00000001 (1)
> >         Driver version   : 6.19.0
> >
> > Note that this may imply that the camss_version enum should become part
> > of UAPI.
>
> Wouldn't it make more sense to populate this field with the revision
> of the hardware?
>
> I see that CPAS_TOP has a TITAN_VERSION register for the newer chips,
> while pre-Titan platforms have a version register at CAMSS_BASE+0x0

That could work, but not all camera subsystems are based on the TITAN
core. For example, Agatti is different core but also exposes a similar regi=
ster:
CAMSS_A_TOP_CAMERA_VERSION

We therefore need to ensure that the version values remain distinct and
do not collide across different core architectures.

Regards,
Loic

