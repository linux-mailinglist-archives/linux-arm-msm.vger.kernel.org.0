Return-Path: <linux-arm-msm+bounces-100711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOpfHFc9ymnG6wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:07:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A591D357D3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2EF2C3006123
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DACC2D6E7B;
	Mon, 30 Mar 2026 09:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ET/UdSqr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zg6gPd/a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D7826B098
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861604; cv=none; b=XT8zrTsXImVMYfNUeHqtwPShQYxFUjD8AS8yquqARbpMKFSptkxu5+HsY9KvxykE2CnSdUGYr+I1fwvaod8CmKGLHBVdtSd6iR2j77wBWv03jyCX62OQl83xy8TYK+a+GAw6DAavIMNHC2RWuOsUsvwPODhwRQqgJeHPXcc8XTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861604; c=relaxed/simple;
	bh=sZsoIdRC9B04q5YRRAZdOqQikhJD2vxMa0zS+06fjB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KQkTjuIkKhtHP4ttY3ofi/0txXwGHUW2rMItGwwH9weqohXwSasg/ybwjfshIWabHZ3XuM8GdoWCZzTmdsH4tFfhloLJs18po5MHB2banAmWWO4Y58zlZpscAv9QozLfU8h5PTrDfPdEKRfc++YF9rCetRarp/6vdHQ4Evp1Yco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ET/UdSqr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zg6gPd/a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U5xRBJ2765461
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rh5zcw05UK83blvBKX/oanh4Od7m929F2CHb2kAbcsA=; b=ET/UdSqrSH7efMwo
	HVDnAoaO8CtQquFb8Xh7jWubxKIwysRJvJ+3wJGUEwrOSiuz6UvnUWuuzzcvvuYJ
	NZOrTJZcEWWX61B1aYMdZVCGbr9j60vSvzk/X9f1q2S9/5tD1AqpUtzHmgk+wMy0
	Pzj+dntcQu+9ZxUhscse2pW5+5x6QSX6kyIGDo0CqvvF/UIGgqdhd8mETXEuVxNv
	0r5OpTeWmYdRUOj6GJyMACeu6o9W+CYCaXObSqYGIzPwbyFNcJ3yum4cP6o8NZOq
	F8LpIZSweh6wMdE9e528pAuyNDo+ESGXWjbVqg51fyT0tnMZ+8WGVmCIeLwoOUXE
	hqBIKw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c3ar6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:06:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89cd0f68ed4so17228586d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774861601; x=1775466401; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rh5zcw05UK83blvBKX/oanh4Od7m929F2CHb2kAbcsA=;
        b=Zg6gPd/ac1hqsdqHGgtqcF2aeRZjLRi/OQPPY+o+RVqXO9P/EvS1BmR17EDzxwUhBE
         4px+id1/S7pJed1FZW/tQO0zIlYqJ5ZAxhNHNJRhdLm5AtAQ76LrAvtGkcIO/IECIUrI
         K5am30IZ7x9wIj8qapsPGnQyZi+R7QX//TbcjA4Hpiez0l7LegG2iZsqU07MpQe5+p4P
         8yY4BhchDRQ3FNJqX5tn9JvT2deD/QHPgsWqhiYo/2COokMxx0BYSXNdWz8mZ4cx2z7r
         XVDCf8rCXGtOMukr4MP9KdO3BgXq86KouF769zZB8Z9plUBmZiFp5HvLSfJTy5iSj+Ju
         +AgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774861601; x=1775466401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rh5zcw05UK83blvBKX/oanh4Od7m929F2CHb2kAbcsA=;
        b=pRsLZV5Fa1MCHBZYGceRjHlITh1rFQON6zrWUWfsIYw2zFIgcuop1pc5g4q5mOKxY9
         DGumqgVU3zUwMFFwuoNt/ODwdwvGp52AXe6l+j7qeQ5GAX60ifXaLQdI09cEdQ1Nmy4c
         gD108ZUnaKgQ9avKgc0EM/SYSLXEKxBMLOeeiBzuJVbsSimRJ1ku+ZoN8vHFM8opo0OV
         os/swVrGBdyjnp6jg5BkT9DquwFUh6F6zmXZeE9BlaQOGOIqiQB8N++cOpPM64LG6vBm
         aBOasphUX0HfWT/xlPvapezNjc+V6TbG/J3pOiyVqEor6Bqt8ra7cQbio2hPSL7OBCtT
         RSZw==
X-Forwarded-Encrypted: i=1; AJvYcCXVdxGalYbVOVYp22V2X9ibyDn5XZxLOHLCLJrop4jREMPOfPGBPkc+t3CU6Fbkttb3WAQsQbo0AAyGGQwY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg3gBVccOS9YPXr4eK44bR0c3AttHrXTkdF4hUnNIF92hi+KXw
	MBuTaWyYjUaRB2Nr63nNNjt8TnXgt1NZRatUH0MqewE/KBdNL9VY+tKYe5jpzsi3XIwaK80/VWL
	XDitrz3qTWhVvR2fyRt2kNFgfLQ+s+9p3ynC12KeE05XXF30TeW2SNKLmUP6z0WVk5H+G
X-Gm-Gg: ATEYQzw1sTzJIcC4NtXqDrSsAElFuojmSC7TCkZdAx9us0Ss3OOk9xXTxfViTHse15y
	j6UmJJHB58ypn1s+KL2nC2B6EwgP91sF4iKT1bNgjo+erT7Oy36QJw9UD/3LRihUc3hDmuysduE
	TPsqecLg3DLZAfltrGPLS3kJ4tGDy8xeP+cjHX89E1bXCXNN96rg04SeOxqls0muhWfLpQ1PFML
	J6ObQdZ4WGy/3MQBxM1VxId8lm7GzqEAKR7qfFzGvVPeXHb1vrVidtWfYuSKTmASPabxRTwvFhg
	p1M3Sh33kzjg2NBx/41oAFh0snnhqZjI4tDPuLJUX0WIpE/PF7TQpk+9Wj+BD1KAEqGAy7xxlz+
	ECEVzuOLcVHop9i82nkecmfVJtbsY5ILQYrtW3Y797tNF8epUrGmBa0A9FkPGluxa7N77qW6Fzl
	eDyyo=
X-Received: by 2002:ac8:7d0d:0:b0:509:d76:fe73 with SMTP id d75a77b69052e-50ba3858beamr122487071cf.3.1774861601059;
        Mon, 30 Mar 2026 02:06:41 -0700 (PDT)
X-Received: by 2002:ac8:7d0d:0:b0:509:d76:fe73 with SMTP id d75a77b69052e-50ba3858beamr122486831cf.3.1774861600627;
        Mon, 30 Mar 2026 02:06:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae52064sm255166566b.23.2026.03.30.02.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:06:39 -0700 (PDT)
Message-ID: <44d7ab2c-3776-48c6-b598-70ebf07ec63d@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:06:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: aoss: compare against normalized cooling state
To: Alok Tiwari <alok.a.tiwari@oracle.com>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org
Cc: alok.a.tiwarilinux@gmail.com
References: <20260329195333.1478090-1-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260329195333.1478090-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3MCBTYWx0ZWRfX8Vg8uQ4M5xtU
 rPlkFyWCTFM97DCLrIdZY0wEmawNtT0RnK5+u4uBm1ApZS3lDh1GUVwoI5Fp0kkQ40jcUw9o/Zh
 Yumk1qibPZm2aqAuGpND9kZevZRJA8XoXs9SSJYMZkKNtHYEnRvvXrWakCJkFlX90q0cCvTiVkA
 5U1CiaUzV1G0eXD13vHJsUYCfRg1NZTdg8MJxTTsgdRJiWvsEFKfbNaQQMrFDFlQ3fB8Iru26br
 p0mOCojs0V42l+AULtd7aFGPgRMRQuu+hn+fCoTz+wdmbmMEZ/WlLAdyt+luPBB5fopn87gU6Sr
 zxQ1SC+7JYZyagBwpJFEbtaiEe62qBkA9SGEavY90jrsGyVHnngrHCpjc6aKoOqD3q28SmLAMS/
 C+FSNKxcPlCW9ZT+fI/4VvbW222EQsfTuA7+tfEh7l7FbHGghfZYJy+L7WVPB49bJ2pNxL6BK+r
 I8PLpng17KX7xK90J6A==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69ca3d21 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=yPCof4ZbAAAA:8 a=EUspDBNiAAAA:8 a=nbF18PV4hiENUAV5_18A:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: T_vurUq5jaFTQcPVTHeHkgk8sTfHaofT
X-Proofpoint-ORIG-GUID: T_vurUq5jaFTQcPVTHeHkgk8sTfHaofT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300070
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-100711-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oracle.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A591D357D3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/29/26 9:53 PM, Alok Tiwari wrote:
> qmp_cdev_set_cur_state() normalizes the requested state to a boolean
> (cdev_state = !!state). The existing early-return check compares
> qmp_cdev->state == state, which can be wrong if state is non-boolean
> (any non-zero value). Compare qmp_cdev->state against cdev_state instead,
> so the check matches the effective state and avoids redundant updates.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

