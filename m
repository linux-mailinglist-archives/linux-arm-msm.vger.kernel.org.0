Return-Path: <linux-arm-msm+bounces-90760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE19OCOueGlasAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:22:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8C894418
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E22A73033E5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0F434D383;
	Tue, 27 Jan 2026 12:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HgoSEdbw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QKpsZpaG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A1D34D3A5
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516541; cv=none; b=IkAqhdfgi/KIncowdvNegXyGLKDDozuwXqbqj00QsIRFZYiWS0pGolmxYrCSTM31CuIjOtlHcnylJUckfcawoYdMH0C+OTHTPx4eBLXIbRekTdwQxT5y591oqzOR5dKCoN6uo+sTrYOs4TjLmXL+IsBRtVugLfOvUTd8ZkyypJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516541; c=relaxed/simple;
	bh=m4ARcqvHiYgA3n4w7mt1f54tn6J6/N9uu0/8PXH1HEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yeuy0Czpgj7m9SWejEXb3bg4+LTBpFiH9VytXlDrqToI0JYm0pO0Vb7rhukCXxTiyfFAIyFWx1GWpR+m8FmS8KQSTvIss9C6ejokRGzYyShvG6XuiGqICrE/fxG3YtbSY2xVshyHv9hwVbH82w85so1vBd9XWRA4FXyP1F+owOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HgoSEdbw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QKpsZpaG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBxgni672239
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m4ARcqvHiYgA3n4w7mt1f54tn6J6/N9uu0/8PXH1HEc=; b=HgoSEdbwDaxS4qRx
	1mLrMplBoc3UeTZ98So3u1hniY9FelugKauEiRrMM+Zp95LyLIXsLypRDOKv9bQz
	2mrQRDPLKPBeQLXhHGILMhaky8Id9EE4u3AxsvLhymgREpfAF3JVlKwiKBS7azHA
	AB4ZJYf9QS69R3ctI/CGkjx4LSKBkhDLDAZQHZ+a4vCGnnCyxHJg+FCJWiFcAcHX
	KyKq8bhBiy0l6SYKz2U5LfCzfO+NPw/lvp83kE2fsI0gOsCsEBwbfeUT+Szzk8fz
	AQznP4wq1YTmQqLEfI8NuXEwUryUDWZT6TqFVIzU95uRHAGgvSFBYOaWC/tcFPBf
	nJM8tg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxffs2mg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:22:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-352c7f19acaso4315531a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 04:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769516537; x=1770121337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4ARcqvHiYgA3n4w7mt1f54tn6J6/N9uu0/8PXH1HEc=;
        b=QKpsZpaG3aZISk8VUNCZqXYcFs2lriyVbWFSX+JhoyUM6PkVZnzOGsFbxtRraOnWoY
         1NiSEoX0KvPdMsMK5yIQYreY6CRC5LPn3KvF19BCruOIBqC6pZVhgrI/XdCCfzCtO1pw
         OM4lr+t3TySu1dXtYcI9AZ6TaAEenNXsupmMwhrAqFxnRrtWUsjfukkmx2TI86IicUqm
         AMCmONcqDuPEr0htLFKb75XDj2M7oou23JS6mOPmgO2aJdj0bX3LVYiJ7/phFD5UQyX8
         Yj3O9wkBrud8TSd+BmNCDyyfgWApNsmLtdHkMW61ilzDc0JoNk0ZwWYOjoEyOZz6IiWM
         nXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769516537; x=1770121337;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m4ARcqvHiYgA3n4w7mt1f54tn6J6/N9uu0/8PXH1HEc=;
        b=AmGEVOuOlFu2wDnfjRWEamkOry2vdMgR1p9+khgDB7ep6oKhJvTc+5McTJ4DK5v+Jr
         csefeW185hIGCTbQ79jJPvly/mGgzRfcvOqmsaBxKpyo2CRZ982gDdnl3UaeiMdA2eZU
         qQRzj47koNDXQN8zG8c61m9cM76bqw5REvZ/VxefXkNIUxSckjRj/IXUJ/W8OKQXRxhX
         N/FGtHCvaumrQ/Ce22Io7NS0i+U/VlhVkXc1hNr1Jy7jMSmrM9cFQt9X0h9Hf7HDoYl9
         iGEJ7TQf2e4Efgeo4LQrOd4FADub09h+wBkOKbK5kNjojqqm4m8Uw7Bw0gKOHbjg8aFt
         CSNg==
X-Gm-Message-State: AOJu0Yx/uXV52rPCBBgEJvl/dM/Eo1zUlgTp05jwLTSp0KS+ypSIHkmy
	I7SzthPm9nX2xniSvofWyte7Ij1aQWQ5mKBB/7HQiTgrxiGcEM8PRNmnJ70G/HNzO/0VWss+4i4
	LxrIwFBHYucg/8Sd6oh2KlIDIOhwL2v9IGh+kpxucXx9erAyMcTiVTUAnWp0DaZgj8zrV
X-Gm-Gg: AZuq6aJNuGqT5IgUjnIUIUPXzrYIljOC3+GQQBvMqbpGupAPooDIpKv7E5GoF/p/DRi
	03DS+z+p+/62ACbtuJFhmA6wZ687G2XQZQZ9ctyJLZANqk2MrLCZ39X6oyC6pjZB+1H4onzR0qY
	EJ6kY6+LoAjQk+sNe2PqejS660OI+HAbmE0DOVMKIXbPNkMCjH2vvtI+NydhGHuvkdjJlbT+i8D
	nQ+txWkqgpRkW7qTY0nsUozb6keKYMvj5kD0x22KJ3wOmeRj8D6+bHL52qbkkg9lhB1bAPZkBpP
	AqQFB90TSAs6PyzlTkdExN8hOpvV8Z5drKHqA7DOCDYmakbm/ixSzEoqoK/SB871xaNmrdPY+UI
	67Dgb7xKpqjucWRUigDKXpWC9Kmg06VtghEw6d19DEoZ1/820UHhtHAwx9skBaC2Z6pVoL0rEzw
	==
X-Received: by 2002:a17:902:d58d:b0:2a0:b7d3:eec5 with SMTP id d9443c01a7336-2a870de2f61mr16346125ad.33.1769516537599;
        Tue, 27 Jan 2026 04:22:17 -0800 (PST)
X-Received: by 2002:a17:902:d58d:b0:2a0:b7d3:eec5 with SMTP id d9443c01a7336-2a870de2f61mr16346015ad.33.1769516537136;
        Tue, 27 Jan 2026 04:22:17 -0800 (PST)
Received: from [10.133.33.98] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8720b5bf9sm16151725ad.35.2026.01.27.04.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 04:22:15 -0800 (PST)
Message-ID: <6b844400-54fd-4eb7-95a7-21942529de58@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 20:22:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa: Add EL2 overlay for hamoa-evk
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
References: <20260127062425.1084673-1-xin.liu@oss.qualcomm.com>
 <a780c082-083c-4d6f-9f35-37170b55339b@oss.qualcomm.com>
From: Xin Liu <xin.liu@oss.qualcomm.com>
In-Reply-To: <a780c082-083c-4d6f-9f35-37170b55339b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ff_bHZxUZy_hqr6AdcaB4ISETEjEQjIT
X-Authority-Analysis: v=2.4 cv=YpcChoYX c=1 sm=1 tr=0 ts=6978adfa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=xKXlBZwc0vYRAT35WmkA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Ff_bHZxUZy_hqr6AdcaB4ISETEjEQjIT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwMCBTYWx0ZWRfX/SJ/77b1bCfS
 tu353RapvsgWAEAXGtbXRjglzSHN4Fu7DoVYJ9NzjNPUtKeKLLAG2M0Rn5u3/pfvANtc+8RtaWA
 1HV5Gcl3NzPDhBszyLPwn+Vxhpc9pIu68fxLFbo+SXZ2t8fIwn0ZsYrUO/zHVUEb9LbdvGQsru8
 SCIfLlAQGiB1L+UiL0VrXPZI2vEehRr0Yk0gR/SdKVxXSP+6MAqT/ys/wY+1Y01+MeNWAPz/Gko
 rMKiYXueql8CypXOmiFRGyXn714IB1G8GRnarQ/zB7XMn8f5SURVXPKUdE9QNsVdCJYXzrZGP0V
 XKwgtqocKG37bWWch01xtjzC91bd8JwnyDODzWCzjW3oyNVtCuoiIrCge31AGMgUnet48p3KuTl
 ZEaTm+UZTC4u8OduNgg5GHaxCKEVG606TAhY1WrEJkJtpVi5sM1r8MBxIMRejR14GKrQWCZ3IKF
 eVzC1Dp619zn642qZEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270100
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90760-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[xin.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B8C894418
X-Rspamd-Action: no action


On 1/27/2026 7:03 PM, Konrad Dybcio wrote:
> On 1/27/26 7:24 AM, Xin Liu wrote:
>> Add support for building an EL2 combined DTB for the hamoa-evk
>> in the Qualcomm DTS Makefile.
>>
>> The new hamoa-iot-evk-el2.dtb is generated by combining the base
>> hamoa-iot-evk.dtb with the x1-el2.dtbo overlay, enabling EL2-specific
>> configurations required by the platform.
>>
>> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> This should live a couple lines higher!
>
> Konrad

So sorry about that, I know about it from now on.
I have fixed the indentation. Do I still need to resubmit?

Thanks,

Xin


