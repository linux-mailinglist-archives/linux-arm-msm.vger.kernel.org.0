Return-Path: <linux-arm-msm+bounces-92177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OM6bIbQQiWnG1wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 23:39:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC32710A802
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 23:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D55C300A101
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 22:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1D337BE60;
	Sun,  8 Feb 2026 22:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BsoOHanp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBIOQ4sN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A9C37B409
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Feb 2026 22:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770590384; cv=none; b=DN3ZMirmaZGuIgERw6ci4jWmahn4berT7fv9QTZRkvQIrUGkUNpccx0jpoDMVteN7sky8VtBz5cBqNPrSeWf6hFl2aknHhWXSq70lvQ7NQyYhcdoAB1V0syL2rPrXbriaDsyAFek/G+Hj/yCVWEZovvr451j2wSk17JSE6iKBhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770590384; c=relaxed/simple;
	bh=KhnA001cmBLiTRge7QTvHeHXPdKnZKFDaOU9xp5P1vU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtvD/kDtHaX8UA0kGotPQdy+rnYR5mpoqFiwCMHQbLkfki3SB3+ZF05gB6I4gkV9j9399hXmv0jOzgoqSH2odxmesm9aT2Su1GaDQbQCdDp0Bk9EQLO6LYMHSisCoIzzBifbEzyGU3SpX+VWHQR4dLuobk/SJG5kfW28NwcR8h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BsoOHanp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBIOQ4sN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6187sWXs1476711
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Feb 2026 22:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i0hvmNwVbup3K9BA0emVZrbq
	AEBF7OKynNgcKe/QTQU=; b=BsoOHanp2YYlZQyfPOSX8qes8cIF6jkdue6iA8ih
	AX4xmQTagDs27gP0n+VQhPBHfWHlyrSvjcBO2tzgK0By4Oesb9HvkpZksDVAIe8g
	p82t+PCnABSGOTqTII/D0X6/jg7QDYsn9nNgBHehCE+gayKQ+10UtbjhltwbNvdA
	sMvfFqksE0qUF+KXb0Fz89nB03dM660aVO87aFCsUeawnCE7TKxljyvpTQ1djCTi
	5j/m4RdYLZj8XKtOuuB5Ra7SZRb/gmZkzCSLSWake780ssDlv5nVX1iku1Exdlvn
	4Nf2TcYr/GtdIY+hPG/V1HITf+ELYIkdsVJ4yI8JOGZrkw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c64hnjfts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 22:39:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ab7f67fso1102466985a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 14:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770590382; x=1771195182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i0hvmNwVbup3K9BA0emVZrbqAEBF7OKynNgcKe/QTQU=;
        b=KBIOQ4sNiAwfVMKLppWRQDdGE/IYTqRUWcsg3EVPmFwZGB+pEFpC/+ghjc7G4t2lF6
         Q4hIrfeve2eDHT7IxsRdNL+QuxNh9UpkIG4OcuQKDvvKhH2IZNrLIzii6KgCoqnGloUV
         /aiPP/cz1CyWwqLbartlYExNAO12zabXaJsroYtXMOLWsfXijbTpKZyAICadnOK4mKoS
         fV2fMGcFWfKfF4Wja7SW1vnMjXS4ZzclKAi/i/+jU+v0WM1A2UNcskXA5oRhNlJ6wCEU
         ny72QFozgWPbS/UNvM4CXTEZVojuB1jpq+CL+BIQSlJdroY0WIHygY5K5e8rjSv4vqxI
         o6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770590382; x=1771195182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0hvmNwVbup3K9BA0emVZrbqAEBF7OKynNgcKe/QTQU=;
        b=OGsbVq93y6bnXkhmLsY47kc8Cxzo7Ul0PucG1GLPDaksksXO+igT1xiCkU5O/7ThwV
         a7tdE+7D6K/rw6+DDNXhcW7+pSmIVNFvfLyHLurPG/zDVbj7Jxfe6dQ/s995owB2oHiX
         y6OtbF6IaAScPe4GbuTvTadoGNV8x0PoZjhYr6O9ItzI6lk+78PVWz0T3g3bN3H60u57
         t0YspbyUGejz73MZbu8DnGBIKBHrRk51eATNq6P2Oc7ZHtH00/5ow9y+XmjRzXPXoX9b
         tzZh2yDIiVRA4dQ6uyItCy60wroOaHDQxr8H8uxH9ZhcmvEP+XucL7mh5GmndUI2e3F5
         wu/g==
X-Forwarded-Encrypted: i=1; AJvYcCVSVvTInuSnLMbMT3ZvYRkAIT3hB4eg//JOD4TVqWn/FLnrj0KnXmcUU1tkDrtYC1oh+jBMuV29KM+1in6B@vger.kernel.org
X-Gm-Message-State: AOJu0YxyY1/DEJU857LIiCiE/yRcdKs4a3rzoCQRphw0OjiTbSDzSN8n
	IZAH5ANkTZeAx5E8/BxiXE3K/jmYWx25wSYZ3u78B1tJ47BFp2QE7gL182kqaR0cliz5qJylo3q
	fsz7C6fSyZu6f1YKN5wUTsauPa8IJQ6Ofnq+5YA1vI36FHBwZ7SKR3CIqr6fNnyNqRN2s
X-Gm-Gg: AZuq6aIQRdUJyeNXhZGkoENkHUh2zomt/TmmeHtGQvgtJ6Eerwq31UDVWZDw8DfiTC0
	eglwACbqa3mgFgPgmQqVhdryjd+1nc8Mm0dlx8qFV+HEpc5y2xLof04hVsr5J1DRe9/ATVpGO9a
	lgAYKaNx6ULLcUjjAYuGUrXnHbewUnGQ/P2S92iL/mk2UmU9TENOr+z3kvhDlNRbRyRKp42g2ek
	pHX7Uj/dl0mCHZr1whRxOI9BWWD2xSJP4DXehnHFlD7Q/TCZ0Xwoz4IupTtNjd7zyVopfo2487L
	8cLgQninD1EmslfJEBVXUwoSkxyaZsXQq1rZv0sc/05f0Mysn4bSrMO48IXx286Vv1Mq+KHp5oA
	iBbA1qCOG5jgJPkJlJjABBj92zTTh6MV37LgK271sR+xv6Zl/nxnoaET2uGTLtFoDv+1lquKk+N
	BYIvRxO7PQ9mevJNyKC+1fpFM=
X-Received: by 2002:a05:620a:28c6:b0:8c6:bbfa:36af with SMTP id af79cd13be357-8caefebe3f3mr1203180785a.40.1770590382204;
        Sun, 08 Feb 2026 14:39:42 -0800 (PST)
X-Received: by 2002:a05:620a:28c6:b0:8c6:bbfa:36af with SMTP id af79cd13be357-8caefebe3f3mr1203179485a.40.1770590381705;
        Sun, 08 Feb 2026 14:39:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6f67sm2170402e87.13.2026.02.08.14.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 14:39:41 -0800 (PST)
Date: Mon, 9 Feb 2026 00:39:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Roger Shimizu <rosh@debian.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: kodiak: Add missing
 usb-role-switch property
Message-ID: <pd7hvx3e4zyvvxwozdid7mhuodjfjdpudpcq5a4e3jysndagwh@erft3vzaukh7>
References: <20260207-next-20260130_rosh-v2-0-548bbe0c7742@debian.org>
 <20260207-next-20260130_rosh-v2-2-548bbe0c7742@debian.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207-next-20260130_rosh-v2-2-548bbe0c7742@debian.org>
X-Proofpoint-GUID: PQz_y9J32M8MBezWvjKZfuS7ZHFf2DO1
X-Proofpoint-ORIG-GUID: PQz_y9J32M8MBezWvjKZfuS7ZHFf2DO1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDE5NSBTYWx0ZWRfXy/H4xQH5GN8L
 jvF0bkuPZaYR0I9wyYVgFQbw8kAtGuGOzCaJWhalWcVaWkSECD2disfu2O+q6Zs3AE1B8wgxVIo
 ZxFt0IApKsDdi5u7oRVNW7TwFgcb6YAX9oR72ZqiuGD9Jk28R9Eph9i6YcFeZAQlCmlZuxRijBT
 1cqC551PyaImNbpuzXZCmdecPqRHQr64TcyfzHwP1HZNE1znOMyNcNdWEd83YIYfaf/7o9UkT8c
 BLs6/Yjg/e6E0MPQevIUqfLev38ul/4TT8FAyjW9qL4hcG4wz5X1FUgMrK/WPw88No24FcokXEL
 nQUq9fynORWeck0Zrbd0n7Y8z/1WBjwqv6C2Txamb7ZwWZY1/RNbGBTnxBq/40OyRmI2aIPBstQ
 w47tHYAG/MfRXJ18UE3f5CKCSDcBkY4vfVm0nhB0vkj0lX9fn6SRPOzQvqPvZM43d1fJBKkiQRr
 a77EOeS+ajZO5Udn56g==
X-Authority-Analysis: v=2.4 cv=SNlPlevH c=1 sm=1 tr=0 ts=698910af cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=xNf9USuDAAAA:8
 a=EUspDBNiAAAA:8 a=ag6Ko0Kqwrd2Y-IbJhwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602080195
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92177-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC32710A802
X-Rspamd-Action: no action

On Sat, Feb 07, 2026 at 02:45:27AM -0800, Roger Shimizu wrote:
> Add missing usb-role-switch property to usb_1 node.
> 
> Signed-off-by: Roger Shimizu <rosh@debian.org>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

