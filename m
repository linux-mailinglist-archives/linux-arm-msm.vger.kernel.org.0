Return-Path: <linux-arm-msm+bounces-105864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOYvIO2i+WnR+QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:57:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7FC4C85CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D5A230117C4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 07:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08EB23E1D1D;
	Tue,  5 May 2026 07:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cZ9GopZ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjnEeedr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25F218A6CF
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777967562; cv=none; b=kU3XjJ3rRlUqsc/tUGSvn/cOCQLedDanzdR6m+9b88FSu8+XQgp4dj4JYHK0Qfd1vi8qqzMUBpogldvd/Tss2ZSPHQi0tlvrtlVt2MkC6bVWup1P/uNwdqpu6vJcDwSpf6sEP6ptF4b6/deyiqlVNAx94DEQcOAZ78IafQJ09JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777967562; c=relaxed/simple;
	bh=xdun6LdlXAGdhBxR1x4Opt6gNYAbFT4ZJI7bayxSWmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XECXdaLXbmh0bEzb9qTkWD7B6DgAJRE5ctNAPQmP1ktQDfjdMUCm7EdQOThukLtNwl2IfnVKKONMTNCZxx+M/VqUbO/Rl0GNSse6+UOSxCJPqSVX3dE+TIPjjJjw4Rex8T5uFk7+aM+MhJuQphDP3IuKl4DwJUlmDKVg1sqyAM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZ9GopZ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjnEeedr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6455cqsS4128658
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 07:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wU+VbCf5YgKYDqtVfrNBU7YnnK1qS5oh6UUW6wIDDk0=; b=cZ9GopZ7J5FwKM2E
	GP1WrEFRgF09SeEE1X361cPV9TdbawXPucj1USz0fDo4Gte+AHn5rJiwD5LyyHLB
	GnbeW3xy2ZnwVK6mATiG3srtLkr2nZpXKC9Qw7rhP5wxUDpIFkOeo2zviqP4eeij
	BDphKUEEn1wuEpQYvHLus2giWvp7r8yLz9OakZ06PQwr6tme8LGSrnB8v3dtREuT
	bURWNTNUuATmxAKzqNQzzMGoxrKxl5Dvrc7xTfZ2eohjuGhWsG/KISCarnUBbBd9
	ymL6wBGLs1+h2TyNYLv1qSM9vrJXVO6e5g5My9QOmm5V54lxA9KPKnnuxu+ed0Ej
	feqhAQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsdw40sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 07:52:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb007bc36so124518381cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 00:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777967560; x=1778572360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wU+VbCf5YgKYDqtVfrNBU7YnnK1qS5oh6UUW6wIDDk0=;
        b=OjnEeedrdd6koP4DWKZIv48SaSBalvN5vV4biArzLZJyIUHWGaxmyelJNQqUMmMNrY
         Y9lEtubJ6kDEwVZYNrsn5Uof4de4cgq4PzqZGhToavwlhBsbQUr7jzLA4CPSCUTHF6St
         Jr7YX1/CZDqQXJWGXdmDxpXVLhVzoIXhvgC6NQehtdC8LNbJn6+oHUCCShIlyXYwDfgU
         RMnv50BBZss16MzbusTyV1Qhrzj80hC0r1wlk9Ljueu5Jh7J3SzIzOKZVm6HCrCDxEv5
         2qZFIXaZdpUCMVSJpo60/EapEpOjoEIRwgHeATIIkEijD3hQCQ21zl9Wp632cc/NNrqA
         EGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777967560; x=1778572360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wU+VbCf5YgKYDqtVfrNBU7YnnK1qS5oh6UUW6wIDDk0=;
        b=gxOFA9wcxAGZ31HMTuCby5aXG07NQEo1179rDwBc8eXykA6yDH49CCWYGBDalbSGVl
         vpocC2JH3DiKZigjccTLY65WPdMck2H21X4ERyf4IGbOMLOy0KDd3BHZEkDjB7kf5Sda
         j60PAizpngOoYbDbExOGqriQkeVxbF+yNTvs6OiexGUMUSkozuZcBfybT7m4kbWrjAEw
         o9CyvXVEqs7Zp6L+0KKLlPvGu0icJe/do8YJBE5VZFOPOYQHEsETWI5TEvTUxU47LrLM
         dridjun/N2uumV8z/CVVxRSAxjGbvJj46XceMF2zTUyUIizVBaJswDrgqRDqnq7hrfAT
         IFKg==
X-Forwarded-Encrypted: i=1; AFNElJ9Ci78Rgg/X6uDklHh77GJZSLX5u3S8BvwQ2EMdCSWNi//u4buj2MpT/dpCcAV8tXeR2/6bVj2IwS13tB8a@vger.kernel.org
X-Gm-Message-State: AOJu0YwXVHhPfb2Dfj9oxlnu3Me6i9R6qUi0llZchlo0QZAlUYD3/nfI
	44acQiuv08MOxr+OO782YqkgKydH+LAmssZi+07ulbrp1VROYFfRQ78HBFDEEAGpc85aXNh9ZLh
	+mk2oX71DVKAVd3Vn2I7Z48htg2y04HtCrFboEJGvyr0k9RAc8EevLwq/kJSxVCIa/LQDewyX+B
	GkLto=
X-Gm-Gg: AeBDiesz+HP2kKVJeda/dbSptZijgs8Fid+NrsITaw84RLnIUwUn/CWzpuCIx0Hklti
	BThBLYdd3lDk7gaU7PA+hKxQGviDYp6cgQg3QbyX3bTVdE8WTAb6P64zeFwFkBRkNOYN0Rnng5q
	UvVoVvT7F3qDyX4yeBBundm9dob59jm4cpkJeQyvrJJSLsgeKmoQM63VUf4YhmJghFN4kC7VM+J
	RIKf2LcL4lkbQ2kONubCuOdZ2q8ktxiMpAcgOvhMh5o7rFyl2riI0OzQUkHE8ER1pJIFIw84Mgm
	Ja08CE8BZ9p1rj6JLVXW0OpOXpIqicWctniQY8j6uJf+Tl2K642bAi66RcwIPhCCidXazJ7awHO
	hopIrRAR6WMccAWhPzL8OMgbJcpH4qta3ALqdwVxgZmgtrWNtXEVyTtJmQYERitEOZsPj6yt6AE
	eWmElM8aHiAIDhE3D+
X-Received: by 2002:a05:622a:408d:b0:50e:631c:c38d with SMTP id d75a77b69052e-5104bfed310mr176997921cf.46.1777967559966;
        Tue, 05 May 2026 00:52:39 -0700 (PDT)
X-Received: by 2002:a05:622a:408d:b0:50e:631c:c38d with SMTP id d75a77b69052e-5104bfed310mr176997681cf.46.1777967559582;
        Tue, 05 May 2026 00:52:39 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3d0:c2e8:9f02:5c9d? ([2a05:6e02:1041:c10:3d0:c2e8:9f02:5c9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d149e35a9sm16483455e9.1.2026.05.05.00.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 00:52:38 -0700 (PDT)
Message-ID: <510d693f-1cff-47cd-91fd-4d14af40b65e@oss.qualcomm.com>
Date: Tue, 5 May 2026 09:52:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: thermal: qcom-tsens: Document Nord
 Temperature Sensor
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260504081236.825755-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260504081236.825755-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7AAM0SF c=1 sm=1 tr=0 ts=69f9a1c8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=CVofd9qyej9kTKCMH18A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: D37R8OX2Yt18xe9lcsY65voBozQvAoZp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA3MiBTYWx0ZWRfX58ZBY0H+3u8+
 HUIVaAvr4FIX8ukyqelWs84KEwGWpc9EN43iRnsf+MJqQ5JMCxXlRv2e/pcyw2Kbaz3jYQqxk6w
 0L0BPUoU8tz80FLofu7iMNDbulSCGHtj3karcASPfGbgAHeb7Ge4VoCkUE3egiWikA+An2abKDp
 ZQjPQ0w/ZSOUgs8FtlylfpWMI0jKUxl92egHVtLs3o/1riR86pavLkhOLEGfdShLoN78Ajf6UTB
 Cgci39DeMZw0yxKXK6AWNh32WMH0oD1u8QbRUIXVWJvbDYRuCRG3pYwJ7hinUFQo1zs9/IQTeL9
 16+h0jznmcSslehJf1y1VczgTSLtYZqm6hWC9IY2uBZ73P5FpNlVhRn6BK5SdKAyCK38Jwvq01k
 PV3Zi3BEhxXtun+xfRP+ySYNJuKca1LllitvPw1pBfK5G+eYTYvHVQ1nP+5/sZmt88tCvfeJrca
 l2fwmNa8WsGHYDwsTYQ==
X-Proofpoint-ORIG-GUID: D37R8OX2Yt18xe9lcsY65voBozQvAoZp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050072
X-Rspamd-Queue-Id: 1C7FC4C85CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-105864-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/4/26 10:12, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Document Temperature Sensor (TSENS) on Qualcomm Nord SoC.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Applied, thanks

