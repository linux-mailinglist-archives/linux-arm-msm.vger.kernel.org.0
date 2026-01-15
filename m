Return-Path: <linux-arm-msm+bounces-89268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9CDD28757
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EDB0301AD00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 20:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5852E0B58;
	Thu, 15 Jan 2026 20:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gchOspAJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gVfyK0eg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DB529E10C
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768509622; cv=none; b=j3CVMtNRRNJ2WYmQaEksynwy4oeZi/zNePyZSKj9niljYu/KKFbfr183M5x/qq3vgNJqFJJK/nlLCIslgRcievtzxw4k69PpsU59SA90Kdb49diFOo/WN0i4Npe/Sn+233usqVEdeYSU9wTQ0/6zaLo4BP/bQtGNLz7ZGXtpPZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768509622; c=relaxed/simple;
	bh=z1Y/0G7ShtxCbdfmUvV370eNXXaGqlXaQZlcMd08kIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mM0GuFuhucQXdVJo9u6ZH/ml6N6gcw4r6Ts+x6cLiHWomK9tH9EGl0COrFbC1/6YWyGlnpJ0XvI7CvQKRd7CKPebOFPGVEiABDBoj3ktM7dTNRHMCgljmyp0uGO2sOZw4BzT2gBJbOjOykWp4mx0KLZigHFuzcy1vjBM87amqJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gchOspAJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gVfyK0eg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FKXApK3621040
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nrk2lcPhO5Z76+PzZInZRQZYnvNreYuDoWWtkxxVEu4=; b=gchOspAJ8ZwScfqg
	txOdUwFx5lZjkBtMroXfJrTOdvmp7BmhvCT7b9Qy5oUDc9KNoqr/ZoWFbFIVAtzJ
	ml3BImHzJDEcnF6BiQAhTFmLb8OrIC54BLdZJtcwRxep5f/oHUaI4FC/Ex5F/ELb
	q/9lWnPraYO7GL+CsT/GgU9PXoRYPZ0NL9LqKRkC1QY9xwrD8MOJjDcB3f9HfjUZ
	Nm8PBu9E2qrfZdEYOHmuLfgP15AIhVYcd73Efft5ORFUgadgyhtbYyqUuTiwWa/3
	9P8hjT4vABaQ6eKe0uJByYelscDhiX5quekQE/M4mcgj/7sPcbOgF8xEahx2/wvf
	7Ag2eA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq7cc0163-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:40:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5296c7e57so491906985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 12:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768509618; x=1769114418; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nrk2lcPhO5Z76+PzZInZRQZYnvNreYuDoWWtkxxVEu4=;
        b=gVfyK0eg6z1d2XCMIaIZDgr07gdxbhxfMg5AbXlRoFTYhccMwynJx2BMMujhwRh7hH
         +TtrgnzoDSRVRQ7cmVsSuFNmqChajETsghT05g2I/xnKGsqmDypuv4f1EZket4GPxYkw
         zvTsOxKcKjFFxXHiBsPeRz4yEvh7qH5ulWzvEpcmbr+4PV5AcpCAzEPErcX3/A98K3ge
         mtUUV6KoOS0ltz/T93NnKpTVu6veBybDF7qx4xBDqh412Spigau9JiWIujzFRadvFzat
         q9FR8ceh4tGIfa3SW07ey2GQZ732jaNyucg+gEyDyDtq2/Hws7N7nPgyVOdnLk6B9UXr
         mTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768509618; x=1769114418;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nrk2lcPhO5Z76+PzZInZRQZYnvNreYuDoWWtkxxVEu4=;
        b=W8RUTrKWj8yC2kaUfWJje1tSgEyYD1w1rnenCvscVrdFZFAjotTCDs/nEsEGuhVytc
         Ge4Bjqcw/U3HVdEGORf7sC8xWedSQvFCwvEiebvDTqpQhFWicv241NlAQjMlw1WS5rRg
         ZTdVXxA6qOZYggAcPDGc+VWVXxS00oGQl/UFWbCypMt1ym5gyVAfEICWoU1AwHIEI2nd
         aD2VsES/AI8heqzN5OJQXO4w6vA7ySBZIMyKQ2JVlbJ0fWHyv0N+qquB8pc466tEG92g
         7aPKpMirJ/pXfSt0GGTIJyiSHWHLVDQhah2z4cHzq+xpTfY7RNi+xo0TG8py4wceSAqV
         bfvA==
X-Forwarded-Encrypted: i=1; AJvYcCWknP124qaMDUkewmosesNZWv6RFeLahlPZPjCACkvGawc0EMfvuc94EQTtMrVizfXAEudv2koHqS9rwNoR@vger.kernel.org
X-Gm-Message-State: AOJu0YwLRamjH3RLFp0WWWjuvFaLVTZEa9ddHJ8PGX1cDMnDZvJ9zuVk
	2BHwDRnUETPIQrnvIeCEAJawr6t+ro6okhiL8yBFXGVCiHsfTnEyXoZa/a6VML2APhwLcFlssqu
	lQlVZSstNwNnZzg3A0kn9FXhWn8YEtiaRdfj1/Q0po/v2OfHtEyvglA4WWzIql9Rb+Sa94t1ZL9
	6d
X-Gm-Gg: AY/fxX6D8H5j+bZu9etlaiyDlUb9bXA0ThIr8CQG5VAvxVJpC9nC2qjJzXt8G1ku6e+
	XUVfxw7ghn++UcUXcKsWdGg3zao+K1yYiPjnKNhApZzvmT/fOucc9b3km5mktTdregihPrcc+Lf
	TCJsQxOA5yQ8mSt4t9DlpNgjTtv9yD4T6jqdkcdHew71UVIERfxC0vJivYDdE7nHcPpUhZ8kTxN
	zqHJ2dxg1poq99qG6Nt/H8fQWhOv5FGvgxqn9XKIjDzUGzBLk6YPsTc7TjOJJCThJYUXggQJVJx
	/sAKIgUrxzM1IbhYNOIbhg6xSR/tazYwGGCLIOWZJwClS+gGuX5+2NkGkD5AzTDwblRxKu6QS9j
	tMB7ZP3wm9tjzj4NHBD2x04T3tz+m8hTagwlD/cVt0dhWnZNxgyr0UR9QNyHWiVPnzKe8d+DYT+
	FPIncgXCq8FZfebrLw0ps8B1k=
X-Received: by 2002:a05:620a:318a:b0:8c5:390b:6eb6 with SMTP id af79cd13be357-8c6a69569f5mr108762585a.47.1768509618380;
        Thu, 15 Jan 2026 12:40:18 -0800 (PST)
X-Received: by 2002:a05:620a:318a:b0:8c5:390b:6eb6 with SMTP id af79cd13be357-8c6a69569f5mr108759485a.47.1768509617910;
        Thu, 15 Jan 2026 12:40:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397684sm139058e87.58.2026.01.15.12.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 12:40:17 -0800 (PST)
Date: Thu, 15 Jan 2026 22:40:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <ax35tcjafo2qvvjpg2al5o6gz7khbwmtp2jrh5xemiwjq6rpo7@64cown27pueg>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <7ruiccdm7q5fg2pixmszr3fqvclvymdlkv4x4xbavkaeczrxgc@5l6usxqfi5fe>
 <619f20eb-77e4-4250-ba5e-78db741ebbef@oss.qualcomm.com>
 <7jhqea42453esyx4sv3okowy7jrdcrd4sxjpm4t2snsyi3nfl4@ieja4c4q3jj5>
 <53760601-dfd7-4536-9cd5-9241800c6c73@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53760601-dfd7-4536-9cd5-9241800c6c73@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2MCBTYWx0ZWRfX/YplvugR1loP
 3f3XVG7aUSP5pvBQyRt9pjaOSZJm6ELhXgvmXwP0F/4eStvZ62fJtjDGpZJZh0Z7JpPf7+FS4gP
 lieGtTPugkfKJHHsd5+le+McCAl6fNgF5XEyp1yp7QNOsQlcMct7lseNt0mYCDfGpzmzN3UsToK
 QE08MDGrofZonjySsW3YVfCXM81Ed6Ch7XspNBGqubBZZhb6PrzJNnJhsW5tc7mjCdjAKGC/iq2
 NWkAp+HQ6sa2lU4Yof0JR+3paQ0QH18bimoXUmWjvyPqyTv2gfniF0OMJCaw7qkWrGRx5Px77zi
 nQCxNimreC+th+t9p5MKpW5BTIhLCF96QPK492sxr72kZGC8ig/g9o0sKv2gSR5t3z/yGiniLWY
 kiiO0xeiDlD3mKsNtvcSoDIlpbW6fkfHLVaSQJENMdil6jl8J2+MarHUkjuM48X0lthp5LX/VyP
 PhvHLAT5PjPnBllV4ZA==
X-Proofpoint-GUID: aQJ4Lla17OkBjLoemMv_M41vlcn_eow2
X-Proofpoint-ORIG-GUID: aQJ4Lla17OkBjLoemMv_M41vlcn_eow2
X-Authority-Analysis: v=2.4 cv=Z7jh3XRA c=1 sm=1 tr=0 ts=696950b3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HHlNd980bnHNeqQiqeIA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150160

On Thu, Jan 15, 2026 at 12:14:15PM -0800, Satya Durga Srinivasu Prabhala wrote:
> 
> On 1/14/2026 11:37 AM, Dmitry Baryshkov wrote:
> > On Wed, Jan 14, 2026 at 10:04:21AM -0800, Satya Durga Srinivasu Prabhala wrote:
> > > Hello Dmitry,
> > > 
> > > On 1/13/2026 3:25 AM, Dmitry Baryshkov wrote:
> > > > On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> > > > > The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> > > > > SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> > > > > 
> > > > > On platforms where a vendor SoC driver already exposes widely-consumed
> > > > > attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> > > > > the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> > > > > of a vendor logical ID like "519") and breaks existing userspace consumers.
> > > > > 
> > > > > Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
> > > > > prefer SMCCC over a vendor driver can explicitly enable it.
> > > > NAK, the userspace should not depend on the exact kernel configuration.
> > > > Consider working with distribution kernels, which would enable this
> > > > driver anyway.
> > > As I mentioned in the other replies, vendor interface exists before the
> > > standard
> > > interface and user space heavily relies on soc0 already. If not disabling
> > > the
> > > SMCCC SOC ID by default. I believe, we should  at-least have a way to make
> > > sure vendors can disable SMCCC SOC ID by some means or have vendor
> > > interface takes precedence.
> > Please correct me if I'm wrong, what do you observe? SMCCC device on
> > soc0 and qcom_socinfo at soc1?
> 
> Yes, that is absolutely correct, Dmitry.
> 
> > In such a case the ABI file, Documentation/ABI/testing/sysfs-devices-soc clearly
> > defines that there might be several different SoC devices (identified by
> > different drivers, etc). If the userspace depends on qcom_socinfo device
> > being soc0, then the userspace is broken.
> 
> 
> Yes, there is no question about that. User space had certain assumption on
> SoC Devices. The point to note is, user space had those assumptions based on
> vendor interfaces which existed from long time.

As I wrote in another email, you are correct here. But not precise.
Userspace had certain assumptions regarding vendor _firmware_.

The whole situation is different from e.g. somebody deciding to add
soc_device_register() call to the BT/WiFi SoC driver. In the latter case
it would be a kernel regressing the userspace (which is generally
disallowed). In you case it's Qualcomm firmware regressing
Qualcomm-specific Android userspace.

> > Last, but not least, the soc_id format is documented in the ABI
> > document. It is clearly allowed to have jep106 format in the soc_id. So,
> > I think, you have two options: disable SMCCC 1.2+ in the firmware or
> > adapt the userspace. You can't control e.g. the kernel that will be
> > running on your platform (it very well can be a standard distro kernel
> > from Debian, Ubuntu or Fedora, which obviously will have that driver
> > enabled).
> 
> 
> IMHO, vendors at-least should have a way to choose what interface needs to
> be
> exposed to user space (vendor vs SMCCC).

But you already have. Kconfig options, etc. What you can do is turn
ARM_SMCCC_SOC_ID into a module (I'm not sure if SMCCC maintainers would
agree to that, but at least it is something which makes sense to me).

> > > Best,
> > > Satya
> > > > > This avoids unexpected format changes and keeps the generic SoC sysfs
> > > > > stable on systems that rely on vendor-specific identification.
> > > > > 
> > > > > [1]
> > > > > Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/socinfo.c
> > > > > 
> > > > > Signed-off-by: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/firmware/smccc/Kconfig | 5 ++++-
> > > > >    1 file changed, 4 insertions(+), 1 deletion(-)
> > > > > 

-- 
With best wishes
Dmitry

