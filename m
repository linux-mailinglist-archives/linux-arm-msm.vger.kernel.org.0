Return-Path: <linux-arm-msm+bounces-118215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ih8XNDC/UGr84QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:45:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C67C739383
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:45:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FKv35ZI+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ii+6+L0G;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118215-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118215-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40C53301FFA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF60D3F8222;
	Fri, 10 Jul 2026 09:43:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B963F164E
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:43:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783676631; cv=none; b=C+4Lcsn9v7YCGf8dSzvIaB/HTCn2T8qST8lOYReGZghPI45lb2fix9Yqk10vfcKbaf6R7dEFdF629NOzFBE0gb9g2/P0uOvbAhIAzU2H2kngVeafqKgAOG7Z/G3+SLl/pN1SQ5CCS15BdDD09MKu6s1Ky2zFtFGW7H8lRnhgV4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783676631; c=relaxed/simple;
	bh=DNEj/bYxVRNoGmGDSfuPj+SgpTbOc/y+W9R3xVCwfPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uyQAGLlhsTUFfzqgGHlDOZCdMykOKi3fMEjnF10EZtRoDY5U3/4SDPeZhqh0HsCoL4P47erM1M6cmNQTk/sznjDqdeoREDx262jUPLrqdUCyNsvv2G4WVgkyvlkuoX0r3ru/q85ye87gZsEfxsHBuqgpDBdZVSAWuQIydP6FQUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKv35ZI+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ii+6+L0G; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7eHOq141497
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YDRs4cZXDmmoZvoqPlGbupiGeT5hQWumLyoKKSvxvvo=; b=FKv35ZI+yER7mhFf
	0G9MVvzDZC3HF3DlWssBkB1aS+VdD1ZOnb13dmcTnUCOEVnWi4B/KiiwQ8sZdHbo
	N0adpdcoNVv4g61+jtfpLXwAF5kGIRhe0fdlF9o8K+AIvutsjxcBBxdapKIvsqBC
	qVijZ+/VN7w9d9ho6yygWyNzoE8t3WSJg0gxw40+ccBvwyOb9CMqO8u3Ot8forAz
	e/zDRyx5Msp11zlzOeGOSkhRKgQDgkV7XA5+bQ53raqJbOXxLyiD520dH1yVNFRM
	rCf2l8Rl4gesAhiqU3H3aUKEuNth8jFi3T8kG1QLe45n1ZPVBzJVivHUXx6RmJLC
	FtRhNg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf5mukyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:43:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dad28e86eso727350a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783676625; x=1784281425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YDRs4cZXDmmoZvoqPlGbupiGeT5hQWumLyoKKSvxvvo=;
        b=ii+6+L0GJU0jLOwlke1bnfgVgZNv8RG7MBm7zWO5KhE339XqXam8/gV2D1IGoaR42I
         zwtSp5GXBmH4eAHTdkOFd23sLbvnD29TbffsUoOn5S9U8H1Ic/35bo5+EEXgTZ5RaPWO
         kxNIbw59e4wSyLJISiO1HgVZBh0Imgbaxb/jcnzbYY0hctneXuLD1IK+CPfeNbzcJpKF
         a5V9MLAphHfUZEcNis7QbWO9G0umL0NQUcNvUlRzbUsUPXuLZfE8c8kxbLh3mVKsjCBt
         65a1dYne7urcXnjyEDIsWup0M/kD/dl2Sowgzr5usKUkR6iCdsG8GLcARQkHHx9kyRcB
         QPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783676625; x=1784281425;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDRs4cZXDmmoZvoqPlGbupiGeT5hQWumLyoKKSvxvvo=;
        b=MQtjbWgNTWG+VtwwCppRBH8+ECFN5PF3YN9DuH7KZkRDo1LzlfcTQhWwrbGKU7Us+G
         M2n0ovywGPy6qs4C9I2X+ekmWqDeEF+y/BAaQr7DlgMlL3dwaVoIhaCLzYW4N0SOXi/0
         mhjhkxIDc62sUIudibWY1Y2X50jUeTTyr2m4A/MfZcSvSFWU9VNJ+gXbjyxHmiI7oPSY
         4oV1joqWV4QWCr3x+b8fWmCvZXFw2DDEWJSAg5qIHUccUaKMpar90gcPq8AyRrYWyWzB
         C1x7C7mwQftjsLm5P/NGPAQdu3wl5Lh5WKR+tkQmdWdDFipi7X3RjTwDfVImBGepZCZc
         TB0A==
X-Forwarded-Encrypted: i=1; AHgh+RrwD4Zk2kf4nZCW2PAD4rh7tbi4usURV4ngIMQjmdVvuE2O8W7+xtE8uaiHXIzmK8PrblhwuGDRVRyROiSI@vger.kernel.org
X-Gm-Message-State: AOJu0YyrRXHX578g6zcc3caAQC9JSb0Og/ayiaALsGfP/fb5FVCmiKeL
	yoRoHT08ttfvj9bbkEx7hwlAPTK62/5cxaV7cmzpp1dxHAdZ2weJDcbXY0LtB60/cVuMLcgSjf+
	tEg2CJ6ut65QMD/mlEPLCiORpQGqaliaS17kxZCqOSMRbIxxuqMPZeVo/u8ySZ32IHh9F
X-Gm-Gg: AfdE7cnYJ9zFG5azSWIlo9B7213GCt48kBUs+Y3bxgTPakLQ6yNB8a3bAR8QlYB7Za4
	0/azbAnNm2DHAj+r3bAiSM64KfLMsCO7AX/BNyxwLVQbl/m9vtGXU/S3DnyUDai7qZ/pO+YV/ui
	NYcZr3WYT49xf//ojpZ6A+UVDI1JCGmmqdqxH56GOyUY0FUylxx8+1Lx0Q/4VC2s52vnBsAb78a
	5XbTDnU6Tfnxnsmx2cqUTg1R/2s9mf/xUHK1JtWAcbtPM7r8Iw3hWnRp2lFRimRRXiEpeD7DLZp
	ab2B4mj2+D4C0HKnaRFX/n+AnhnDGSCb46rbRUxVgq/suSjqXu5h188Vr096ou5dwaB3uO2YmyV
	Vzw2MiAEiURamp2wdNJ0BiuJMxzFwLtak/WRnBoFU/mA=
X-Received: by 2002:a17:90b:580b:b0:387:e0db:3faa with SMTP id 98e67ed59e1d1-3894239bee8mr10959589a91.35.1783676624766;
        Fri, 10 Jul 2026 02:43:44 -0700 (PDT)
X-Received: by 2002:a17:90b:580b:b0:387:e0db:3faa with SMTP id 98e67ed59e1d1-3894239bee8mr10959500a91.35.1783676623644;
        Fri, 10 Jul 2026 02:43:43 -0700 (PDT)
Received: from [10.92.212.146] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b0240570sm5176800eec.28.2026.07.10.02.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:43:43 -0700 (PDT)
Message-ID: <a9f320e0-6a72-4e93-a57f-675fbf5d51d3@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:13:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] spi: qcom-geni: Fix missing error check on
 pm_runtime_get_sync()
To: Mark Brown <broonie@kernel.org>
Cc: Dilip Kota <dkota@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson
 <dianders@chromium.org>, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev
References: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com>
 <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-2-92feb5a7b926@oss.qualcomm.com>
 <2fe34b3c-11cf-417e-9440-75a5d6e3f4d7@sirena.org.uk>
 <0e52adba-dff2-4cc3-a13b-758c8d92e60e@oss.qualcomm.com>
 <5a1dd2b7-6e26-4806-ba71-175b195137d6@sirena.org.uk>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <5a1dd2b7-6e26-4806-ba71-175b195137d6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9QRhFbI-C-nGe5Ska9zdqJBLM8z0KSKO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NSBTYWx0ZWRfX+Gr96dQyIthK
 xwGfaY1tuFyYiLpMND4aslugBESBUcLAwLK7SSO5Y3SXKiCv+vC+61Pcz5y9PO5c3RkR2TH+XAy
 qzx2SOOCZN9XyZ5SEK+RKW20r4PJfJQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NSBTYWx0ZWRfX45HVY8Dsj+ir
 pGLHOlWir15w3MXHrojukAO4wL0zSCTKqXCBp536+4HojKsy+sV1OZix0fQhNbSVHwySJVcyhj7
 scZN70VBM9AMmwSH253/Bzndt1YKwt9cZAQNRg6At9GQNT4ybe3NRJoCEoAzrTsGJFCuBpqn6S/
 JhOaSn9G+F5qpKgswlKoHR4Qc3CwrEvpzJWNaOSccL9V6ojnHKJriBG6l+jjbJNBq7ZmSPrRKxG
 vc5/226AT2g1XXbKecnoLn2RDQqyqL72HB1jRklfYcPENZw2BBeimIrYlb9I85EPvHZ8xjqsEq2
 JN7QWs0KdsV7yBnkgPeSwrISHPx4/HW5DMYDu0/8bkDkC05kl++OLturNKc7GwKu8DmFVRPOoFg
 GAPaKAoYK4y5M0Dg+j+3U2PfDG7QWexyW33SrNzBy13tFlAQWMW8GvOwndz0GffkYYN/9KcFMDH
 nMxW4FnVCOUCZcRGEug==
X-Proofpoint-GUID: 9QRhFbI-C-nGe5Ska9zdqJBLM8z0KSKO
X-Authority-Analysis: v=2.4 cv=N+QZ0W9B c=1 sm=1 tr=0 ts=6a50bed1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=h6hYde8dkmUs3SIWvWcA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118215-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C67C739383

Hi Mark,

On 10-07-2026 14:53, Mark Brown wrote:
> On Fri, Jul 10, 2026 at 09:41:26AM +0530, Praveen Talari wrote:
>> On 09-07-2026 23:59, Mark Brown wrote:
>>>>    static unsigned int geni_byte_per_fifo_word(struct spi_geni_master *mas)
>>> The above breaks the build due to removing the closing brace for the
>>> function:
>> Its my bad. It appears this was inadvertently removed in v3, although there
>> were no issues up to v2.
>> Please let me know if you can add it while picking up this change, or if you
>> would prefer that I send a v4 with the update included.
> Please send a version that builds.

Sure, will send latest version.

Thanks,

Praveen Talari


