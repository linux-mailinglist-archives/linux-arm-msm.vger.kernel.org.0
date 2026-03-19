Return-Path: <linux-arm-msm+bounces-98698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CyMHpDGu2n1oAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:49:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4731B2C9028
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:49:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B2BA301946C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38C4377ED5;
	Thu, 19 Mar 2026 09:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aApKDXeE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OB+BuxPZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBA4376BCC
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913726; cv=none; b=R806prnqwxaTFEDplq7JQszTQ9CLojgSi/8KzAZDu2q6bZYSpY+j7ds2qoqgVMPffJK959EOc2CFcMthP09rkaUKqrHak4xqZ3/sUmde5zZZB/QN0rOzWPyoXiBgNaZsrapXY9bW8BAeLkIWSqP5rK75szvIQdHlqO8xZqOeYMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913726; c=relaxed/simple;
	bh=yK3hmx64z7i0/cHqvhJED58JSXNvxIoNHD2ELb77V4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2owMh9/nIEqca3hIz3ay0pRmHW/KdF8BSajBHAztPITnICVFlNFKIiCFJAgJ5zWxWvnmmhTOzieKuRtUo7gMC6frrEVtaXX1z5VJERDD9NsR1VA7ZyyNZMFN8KEr90P+MzjeSrLrcmJrjyxDbmuptgjgClHnoGbuOR2U+2+poA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aApKDXeE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OB+BuxPZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J747JF3369542
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g5icMpeKSq4HWdTCpQ6cHRjSImJbwCnTwsfsfwuFFIc=; b=aApKDXeEFHAKK8b7
	QuShCV3dhM63yyTfAr0aK5g+JsoRVFkXHFzZY9J9Fbiy2ya6AfYu0u+pkBqUWTg9
	PZEKeGF7MWLJNU2pvqrq1fp/urkmeM3TivNn8c1jZRLHewAfUIa2KM1izYS5gAI/
	cPtMpU2lvRHFwA5TirILrSgSdlT2B5kHetzCBjXI7MLHyGPQTd30MK8Ky9xbJteo
	fYZcGBqjKjldIKgpv7Bx0+/S0vaxjyudNHpZUqdUWLF1tz61Nye3QedkNYG7VGF1
	Tt3cPfgB6OefwdgK0Ih6N20uE1uRHjZWG0BeKBXoTYQVPdUZtYAG6Z+u1hGecc2T
	PkOHLQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00f9jp21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:48:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3594620fe97so4364263a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 02:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773913722; x=1774518522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g5icMpeKSq4HWdTCpQ6cHRjSImJbwCnTwsfsfwuFFIc=;
        b=OB+BuxPZN9riT9pKF231svjSF+IxYyCpYzhg+8KYiUkA+g2yk15LOo0k9dbFEVi8YF
         0vLW4fj8mHp5KoclDVTzNIAUDk5exwdRan2zOWAKSIfhKuI0jnPeWhp3BgzKJ/NSZ9Qw
         ZYtp7/i3yS6mmHw0sXst511baxQB6MyN8ZhAZ6EMSpGcDMnbqhFjLyUaGDcmqdFrBw9p
         cSymYszB4ya5oU5h6/PV1WQjx0xUkFuuUgFG9gqd7tISdg9ynlyDm3ICATLI80s+e4tD
         0f+vN+pZTNhMEL55kck6/lohEhQ4cU3fmSy5xKAGk1WZc9K/vN9N77w98yS1K7iZKzH2
         jQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773913722; x=1774518522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5icMpeKSq4HWdTCpQ6cHRjSImJbwCnTwsfsfwuFFIc=;
        b=fhVhx3ts3Dht+FkpPuKx1a+Pm1tRSinPZTiGjmJbm0+rXFeg5OT/BfuBJn3P1At/V7
         33xprNGZYdLx+LI+poy0soeP5NcIpkfZ/B9uDPdmLgrYy5oFdgA+EctKnjysF0Wm3mVT
         HvuChhPXqWr5CH4GQbaYqtpbSRKGYIJ6lMH3YjWbgeHlyk//ZpxnuEcPxIJ1JP4QVnmc
         p2eAzpmhCMoefUugS24EfldSHTP4WKzqqRrodwGHoNcNw/s1SZjv9IVadquX7or1Xtmt
         uRAFaHVi5VGNHaQnPAaxF5ttW+xIGixvzyc2cTdzjnF/sBJafMXf8PK6+9wiAzh+4UC8
         D2LQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1dppDKx+t6+zYjtVQo05XI3BpNn/WM6yoVkxrYjKzbvMwYOTwO+3VOsELB3zXNM0hhYXnzfxM4/h/APE4@vger.kernel.org
X-Gm-Message-State: AOJu0YzXSk3JZVaOBTQUgOEzohiGhVc1rkbYnExQ7BISW6MbxqXrqkna
	etom6Z9dTungk/DX/ZeL6Z1DxsafgSgoBXHaDf68Upcy7VyHoIRdzEsekdIR5oupTwLOWodXZU9
	vQTJCSYERqOG52+ehxdSDABfLccdTvPn3JAZIWJKSakojBBii5g1N40rTmsbpJvGA0BU7
X-Gm-Gg: ATEYQzykRx75twVVHprbDPsOe57AEoJKGo6PZf4/H/dlD2n3MClnGATtaBd99p+DDO+
	/mrD8iDBKXnhRCRLxHr2JKwbhhW6X7XIqMWXm9xQpeZqi14oY0FvpBnjI9DzQTtIMnJ+h5GZEL/
	nEocJBFAiYAuxUKc3vFK6LSkGy+HpQcw7ujnQj3UykoAjnL29rQ8LD8vSOeKsnhj4tzp/4KE2iu
	9eQuipimsKivnBFf1bClfluWi9HKRHazkh59PTDh9NQIqeSu/++3+QoZtb+g6YSCrGmpGBMHqM1
	X8vjDPXbCyySaxPxyWxAvZaM7S+t889nm/7WlPui3ph3UZomhdsZ2AXKPwRHeTmSdxMItLIbDEv
	OVsNScuildazYbqkBg7Exv58dPEA1NqKmJwYgxL0gxD0P1uK8k98MMRv4tsP+OMermlcUt6pbzP
	rL8g==
X-Received: by 2002:a17:90b:2687:b0:35b:9a4b:24e7 with SMTP id 98e67ed59e1d1-35bb9eac31dmr5712200a91.14.1773913722169;
        Thu, 19 Mar 2026 02:48:42 -0700 (PDT)
X-Received: by 2002:a17:90b:2687:b0:35b:9a4b:24e7 with SMTP id 98e67ed59e1d1-35bb9eac31dmr5712180a91.14.1773913721746;
        Thu, 19 Mar 2026 02:48:41 -0700 (PDT)
Received: from [10.110.95.239] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b07a508f00sm17197835ad.80.2026.03.19.02.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:48:41 -0700 (PDT)
Message-ID: <1faac95b-4c67-46d5-9c59-da4963e7e8de@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 17:48:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Bluetooth: hci_qca: disable power control for WCN7850
 when bt_en is not defined
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20260319075125.76539-1-shuai.zhang@oss.qualcomm.com>
 <CAMRc=MdRGdR=FyQHWC7yfAgpAFxiK6QGjEQXVr7mavWLOPS14g@mail.gmail.com>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdRGdR=FyQHWC7yfAgpAFxiK6QGjEQXVr7mavWLOPS14g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3NyBTYWx0ZWRfX/nKMjPk33KZr
 bC3I6reEJ6UOyJX9Re2iDTQ9h+aZaB/Ba13166mUBSlYWje2aL2W0BEYaNzKlc9pMD05NtFMAHR
 z2xf0K7XGZJkAPMmQn1tSDyIlDxsSUkeGBhUne+wvP7xOtVpwY58y8QpMRdbKLQoZ9eGjjpAGwb
 ncvb58NOzTDVYF5kF8jfBChMqYnDRoaMp07bRgj4BrPMnlTJrjue56s+GJJ6k4WpsyKylHzSs2f
 LRdRIK+Ck5vqZIcmGSeso/9AD4VCmHUrI2CNS8N429ip/Osd7GP3Lf9kWnWXWrtBaEhPs5h1iIk
 KDBCiyXA05v3UPo9+If6DzFRtUiTY76ffT4oV44FtY9TKimgrjhzDuhY8nLVch12HyROZ/65nI9
 X1XDzpxMGQ+OdM64elpOrmRYjsmp3n40GcVXi9rOQ9eSzun2kmQ7LytD1xU5Hx7aFejR3omrZOo
 YJ1dw7LBve2QXateWxQ==
X-Proofpoint-GUID: YIYxZrrae0WLlZ0KXJ9g8oaWhTZOYqau
X-Proofpoint-ORIG-GUID: YIYxZrrae0WLlZ0KXJ9g8oaWhTZOYqau
X-Authority-Analysis: v=2.4 cv=MJttWcZl c=1 sm=1 tr=0 ts=69bbc67b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xvFTm4SV79vVDnvSsuIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190077
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-98698-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4731B2C9028
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi  Bartosz

On 3/19/2026 5:35 PM, Bartosz Golaszewski wrote:
> On Thu, Mar 19, 2026 at 8:51 AM Shuai Zhang
> <shuai.zhang@oss.qualcomm.com> wrote:
>> On platforms using an M.2 slot with both UART and USB support, bt_en is
>> pulled high by hardware. In this case, software-based power control
>> should be disabled. The current platforms are Lemans-EVK and Monaco-EVK.
>>
>> Add QCA_WCN7850 to the existing condition so that power_ctrl_enabled is
>> cleared when bt_en is not software-controlled (or absent), aligning its
>> behavior with WCN6750 and WCN6855
>>
>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>> ---
> What are the changes in v2?


Sorry, I forgot to include the version update differences. v2 only 
updates the commit content
and adds explanations regarding hardware management.


>
> Bartosz


Thanks,

Shuai


