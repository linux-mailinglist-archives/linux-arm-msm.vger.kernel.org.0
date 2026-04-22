Return-Path: <linux-arm-msm+bounces-103996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFVkOtMc6Gm/FAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:56:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F85C440F39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72721301DB89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 00:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2021C84DE;
	Wed, 22 Apr 2026 00:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KW1mfgZw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VlUge8t3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C47B175A6A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776819342; cv=none; b=VpQdWO057jyp6NisiozGVSj2/I3+jYoqBr8AmXYaFXPB3ELLSlET4/HkUZDeB3kcMvV9sFc06ybff7lcmpMMLUDmh4QvR7ooYuK0ISKrIXj+5gOeXAiH9lyjWEEPrI2kOxrNboCNuJ1z0ITIYnYDCrX6gui6M0XmF7Zg8DAZt9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776819342; c=relaxed/simple;
	bh=6AkbpUFiVi+NvXSSBQg6tSo2wDcHwg2Yg/KM7VsukJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQnrKEq9gfW8jeUDT3kceDRYlARCqJ7fD6IAFT4JInny9RnX2CTiW7jFSF9ybpJqS8M5guVFWKQ+wZil1oB9ogzAmFHrInbUhvxSImXVDC/Ec1bLTOBYN1EEkkxr7je408vBNEstXB2KoX2zCqQaQ1VP5FCgKSuKMDnVfDNgUd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KW1mfgZw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VlUge8t3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZnd03730720
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fPOn1NAqsXtS8BF2EH3x06ZN
	xZhNwC2VHh7Rq+wAPUI=; b=KW1mfgZwXkzb2EEPJPeLpJ4rWLa6oLoWNtG/Lx1r
	KQleBgEvh3GFOetmky8JfmCbC1PQGLkVQ5b8aqgt8hQJrgtljzYtflCSIrmthjXH
	t6/4aR94mP2HQQQuKYzw3EXMvHms4zK7AZ55XDPJVPXy/cp8cPTb27RNhVHcGIQt
	QUkfm+OAd2lFUEydi2T3xyN9PYopO9auGDmjEfPHqbHAqMBqkX8pTrEd3EWpklGl
	AqDHnjKzttRjBoa+G33GTfL25tE3SzWpiWuk39kPKM0e2ZJA3CO5CEccKYtsu6yL
	tLHXqqIN0tQFVrzQPeHdwAA55gvbsbJHBVYkOk4EUbvZUA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfrxxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:55:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d654ade33aso230945685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 17:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776819340; x=1777424140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fPOn1NAqsXtS8BF2EH3x06ZNxZhNwC2VHh7Rq+wAPUI=;
        b=VlUge8t3FcHuj+CGqD5m11vlZ0dsr8Sa/3/8guZOlseW/0tQ/UwdpYeY43phe3TBsh
         OeRGAlna8agtvhdB+R90TjXyK4FHSdHKqHA9NKPPm+xPXAlCJk5h7YX1RBkbeL1KCnDo
         WLTVzze7gau0mMRzWwmr6PQY0X3wJagaoxb7bvCYU6sm1iZRbUbwQypp0ahcSa9ydiX1
         wNzmn/tJtpZ19LO/lkSWA8gyUbN43Qz6RFVhL+h6JY5VV0btp5O9aop6nOmEmk+3khtz
         +w/6rNm97H/ZtK4rOzaJR9qjyUZsfLaHZK5ag2lv6QFSlQcRpQpylLNaF8qxCSGwNhZ8
         r+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776819340; x=1777424140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPOn1NAqsXtS8BF2EH3x06ZNxZhNwC2VHh7Rq+wAPUI=;
        b=L+jBT7ApfLQU4dBJl+1yFnmAQ26ZxwzsxIaSYWkhpP4wnITd3iRyvqaYRZD7kH8f1B
         V1ukZx2VqP7xnrHe6v1UZNKYuyUG6KoGLtdIZNhPmsoGdXsvUYhuKmgSmnDOSkgnJ2bF
         oTeDdE0GtlwcdEl35UiaYOZi+93lqAw0289cc/5eTTVRCgmlPnYWYY90wJhr106IEpbh
         zr0Aq03UrGtNWWeLxyv6mNBnH7ymZifsbyn4o9w4t9sHVKau/holIdwpMHVcSKKqA59b
         Yr8FdqQi6ZBCYKoVDNIaL49ioKvWNFmizPSPBWMNuwWY4DK9EyI7jPbC9CG3zz7wTJeo
         GaMA==
X-Forwarded-Encrypted: i=1; AFNElJ+SRNb8ueq14Q3Uv7jjHa2vs2a/aZQmS4RPkPe2RhQIsRP5Hlet3N2GGi6dS05tcyL1jVUM/n2nHfWLBSEN@vger.kernel.org
X-Gm-Message-State: AOJu0YwQKom2990PE3I+7/D99zE84GVPMoN7r2Bpxb56w9acboS4gR1C
	YVU1Agx5hlvOh7cfGmSBRfrDIp8uJ0vFOkyIEOXDv8dCYceSp7r5sTpu7HjJjH8t9pbXnQcOb7A
	uTY5noVgMBonUPKEvYCk6QNNlx/I/J/lmem4aPtvAg/uxiBGVrhnq0t/vYzx+aV7hweXN
X-Gm-Gg: AeBDieus07Xl7CweT4Gz84/NQQTv05kD+LIvK4HY0xbePzKj/yRbo2PlzL/BaDpn3wL
	f1m8tov4spqy+BaUGmjRXAXAflET9FhXE/SYbzUA3AzxgEO7v5XOMUAUSIZAEjL6BXQoHLsQtjQ
	Lx/Rew//bhicSqhkvIiEWD+5HYbfjA/x3V1L3RTvTkswVHMtRnJw6APb1lWtugzBFL1qZSi8ZN5
	t/KOhCE58xY4FJmggj8IRhnWKaDlbAqkWRARMtj+mJDCLjhXO8NCJ6cq0bX/ZmP15XsN6yd4UMO
	9a7kImpPRWoO1RtBZm+UFtU0A79lEYdJlu0y+SG99HOH0f1oyeGfi8BSux/Xbwdr7S3i2eXv5gj
	sIxIJuXCv11qNH9kIpCQxCzlk4Rs7xucoj99+pZ0wV7UKRlfnqam/rU8w1ymzKG/UMOH1bS2zls
	bRcNYNOeVQ45iVMbwEIr46QXfLRbYkzZ5a4966R3LybfZWOg==
X-Received: by 2002:ac8:5987:0:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50e367390a3mr272994731cf.23.1776819339954;
        Tue, 21 Apr 2026 17:55:39 -0700 (PDT)
X-Received: by 2002:ac8:5987:0:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50e367390a3mr272994511cf.23.1776819339542;
        Tue, 21 Apr 2026 17:55:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7dfesm3991891e87.71.2026.04.21.17.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 17:55:38 -0700 (PDT)
Date: Wed, 22 Apr 2026 03:55:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH RFC v2 3/3] arm64: dts: qcom: eliza-mtp: Enable
 DisplayPort on USB
Message-ID: <pgmbgau5tpsoh6lrwntlxooy3ktdn6c3t5ru2r47joptwd25ua@f7r22q7dg4ea>
References: <20260421-dts-qcom-eliza-display-v2-0-67f8cf155331@oss.qualcomm.com>
 <20260421-dts-qcom-eliza-display-v2-3-67f8cf155331@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-dts-qcom-eliza-display-v2-3-67f8cf155331@oss.qualcomm.com>
X-Proofpoint-GUID: IQmIO6fdZ7-Vj6f6vQPfkNmTsyhuazFO
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e81c8c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=jqvgCZr2CLc5mZK5VosA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAwNyBTYWx0ZWRfX7f8tDHh81rhu
 syo4KwrTmOIsVvDBc9YYlgVG/OQyvlNjkMG+g+CxDtxb2PakhKp2ub/K5NuiPfnGK9ERjSFEqbm
 tRvCAmhPjPNJF45b/P8oXEouJyPScH50F7jx8rUnan7mQdAh9aVOjTG4TgdCFK8StdEu1D256Pt
 UGQUjSirlL/UesIJMegTddMRQ7Z2zv+z/7Z+F2lPyINIqVmh8hvKuaWr0Y/Culf754Yg//P025g
 /GWIdD9pEDmV4e0tXwuXDaow+oXw9MJbVj7fs8Vs3k93o06jOkSuu8NteVsDcq/DEw9pjj1CzIk
 KtbZWRF9TE9HzqFS+FqKIyPe+/UIiu5kgG39sqPtihO+DfTlL1NP2YdmtrwV0wCnpQOey+U4hYZ
 L3KbQrJ+zT6XyxT1iD/jhOK/yp2OKZD81DC3KqXDBDsnrveKVwYAV8lmtBULxwf371u0VJy5d8X
 EInTIfvTeReCXvF8rLw==
X-Proofpoint-ORIG-GUID: IQmIO6fdZ7-Vj6f6vQPfkNmTsyhuazFO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220007
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103996-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F85C440F39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 03:45:30PM +0200, Krzysztof Kozlowski wrote:
> Enable display on USB DisplayPort.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 8 ++++++++
>  arch/arm64/boot/dts/qcom/eliza.dtsi    | 1 +
>  2 files changed, 9 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

