Return-Path: <linux-arm-msm+bounces-96697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNd9BNIqsGlHgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:29:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AEB251FC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CA663433DB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFAF391E78;
	Tue, 10 Mar 2026 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YwO7UoPz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gn5YlAg4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66524391E7A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773151352; cv=none; b=BT6y3/ap41pvN2Z8U4oVl7mOs02KNA/iKVN5cw9OfCmUrfFDRc8E+oBbrJwHFgW8/vIsMWSvnPJTn7oyaqwsfRalHXJhNAoTsKZlCxEnmEDmKBLz9IjEZ3cXdhcq/WwYAt3KiycXkz764J17e09Z9e5pzuqbx4EEij6gMAclddQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773151352; c=relaxed/simple;
	bh=OFUybkUf8vdEHe3PSUcex2KtpLylMy1rhKRzm1cxbaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8bVxGpHyff7GrdZIrZqw/6NmP5kIgohUSzNOz2hcU+Zw4hdwpJo8XyxCTvEEEqFrnRTjUYoS2xxzC0r1TWKaXyPAbK3N7+4nFy8+VRbPdmvPmm6X8QX+k90xUl6RxJVLNxknwWX9z8LG1JFPwnicYSrSQqNYd7TPm4yn9awUkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YwO7UoPz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gn5YlAg4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaX9N1502969
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HGsFiQXLQt9DSM+Ta5L5Ex5G6pMjtkJsxVlYUwbn44o=; b=YwO7UoPzeWtoocVa
	tJll+zsRiZG+vhdVTbcQkv2S1OlOtGN4QrKwRedjat9j1AsYL0WgL+eWKtUflco/
	pikeIJa36GUVuK7L1UAyGXX9hOUH3aY3586LAXjsAor0bRgtr7Na085DlvmxkP7B
	WGO0pIM7VorQV846o4CCrYBkDsuyeoyMX2reIC4n+rmkLmYRSMniMAHOCQG1Wgbu
	tRBhtn9XNafijQQu7eWoG/+kTUQ3QzEf+0U3TOyuT2atfotlCGqZY1jWevoxW/C5
	BCggq6zHg9oTuOwfLXZgwUUfLeF4R07HULOJspaoJ4xINjTrUtNN7M/eCD+GlC64
	l+HJ+g==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8hta1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:02:30 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4170ae36533so977580fac.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773151350; x=1773756150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HGsFiQXLQt9DSM+Ta5L5Ex5G6pMjtkJsxVlYUwbn44o=;
        b=gn5YlAg4nJr9G+tdZ4DaGKlPhYSOa9z/kUqh5qkLzDzOW8wFHGCeM3Ncu9d7nD82Jo
         9FxHfnpf3kfIHu9Z33otsd2LAZWIbAkVfBKZaaDfaqgjzBwTvWxJ2B+a/ccA2vaANUd9
         6k0yhEgBP0V46EoOwplgK5Exsac4AYFgC1+0GfIgjivFuKjAAmvS1CEhqC24o0+etDlR
         3YDZ5km4g4Cvb+vd3JjwflqAsxa76VRC24a42D39Z4i3ZB7mIfffYG+o/4QNJmqo5W0C
         791/u+oDL43nV+n/XHaKPlw8mEG1QcYGu4J5pqP3w9wWxebDVBiY2MvKNM1mmwH4/2Cb
         SBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773151350; x=1773756150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGsFiQXLQt9DSM+Ta5L5Ex5G6pMjtkJsxVlYUwbn44o=;
        b=Uq6PQupRWSyiqkfP5Yoq2lW2x0ojhlSXwd3U34DZqK9LjDc/kJF7HMtk+eLtiom0Dp
         VeqRQE5cJg4uZMs0NqFr2y2oHkTyJ0ipkQeHaFNBVjxOYc93c2BWKJq4bdouk8vMvm00
         rvrTYIP8kB4bBDYnioDbp/O4GLntkpZcmj2g7VIzYpt30sMgOtKecYmVFWWclj8x+ZC8
         +zA+mQk4Zze5uL/h/i9ZBZ7D79/jCX83Axa66WdnHPSVB3RHnQJ4rzuK03J5aP9J//kk
         1qKGKc0SxM63oAe/zQJy5uvPutRvRG8b+CKHlB+G8pkpbw+2aftXvg7JZr0iqRIkhm+e
         9C4g==
X-Gm-Message-State: AOJu0YxSu1wCcryV2KfFvrb1Kl8V73xKluph/BouRFq6+sjb3Ef+PyT+
	aA3jTVXftGAet+ABAOmgn04dlaBU0i4hEqCGqb/s2LBWyOwgYLnVdkvS9TrwswR6GQhBh8cs95u
	SaQ80GBXSgZzphwTynCXR+7lr7Um9TIbGVwp3yGMX/FodD82wtaxIS6cA4nZNZoVohOiv
X-Gm-Gg: ATEYQzwsnwhJzXcSYPw8KFondq6YbjXGJsZuXUCGBT4spQMx+fx1kSlRtMY4kfIiaMX
	yUPzbjYBeE7huXiuZqB5TbqMboCTMb/0+OOqbVBBTvop9HEddMFQTrZS7Ayljibpzs3XjGmUlNi
	Fy2vlXrxb/Lw7eH6+V0o2XrRzcoiyoRTvyEPGX/QSZ2gthvfFnHbQtMjCP6gX1RK0JEP3bVfQZV
	1sCUB0E1S5DiqDFBQRtIhq3fcQK47ITDiiso586mrqnDfYfqdobm7kksVHQ6g5+MZKzHiUK+pQG
	dBBtSGkm1TjSWOfx1TrgnmX14SIyr2VEPMu1/oKIGtjlRxke7jF8+16Aa5JYOy2wxQZ+xV2tsbI
	HgaIYu4TihlOiguFt7JIj+WWgNGP3qOB8LK8poFMB3jCtEvyHGoDDqaHYtucmu1Z3wGTUP9lst/
	DV+5k=
X-Received: by 2002:a05:6871:6caa:b0:417:1b7:5b91 with SMTP id 586e51a60fabf-41701b75f47mr4135663fac.8.1773151349593;
        Tue, 10 Mar 2026 07:02:29 -0700 (PDT)
X-Received: by 2002:a05:6871:6caa:b0:417:1b7:5b91 with SMTP id 586e51a60fabf-41701b75f47mr4135615fac.8.1773151348804;
        Tue, 10 Mar 2026 07:02:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b943032e008sm484115366b.44.2026.03.10.07.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 07:02:27 -0700 (PDT)
Message-ID: <152ebac5-0f06-4f23-afca-649d25df585e@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 15:02:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] drm/msm/dp: drop event data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
 <20260305-hpd-refactor-v4-6-39c9d1fef321@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-hpd-refactor-v4-6-39c9d1fef321@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyMiBTYWx0ZWRfX7BRg7Xd3h6Zn
 H4NXdrSafZxdqO01jJbVVMULUK5kcKgb9/OfU1clfowh8Miqxw4okYvkJj6+spMIS6H6UfdCD1B
 34q9IUq67XGK/uoGbSJCmF0cIgjCl/ou/O2YWCt4cv0c+2E5mffbaBbC1XMAy7JD16w+ZCFmCXr
 o5kwTLze5MpYzdqqsjxG3UGu2w61gNSrssImPYazx+TUWML9bmJ+srMvCtX+dygZcNwJpqNsT/V
 d5SkU76op1bDPKY9CN2V0E0+I5R6jG0yjXkuhFS9sf2/+ks2SjINyOVXOrPWL3dZWuqrP69mcAA
 tdvjgXjbgvAUtKrFerYBGREqn8I4r2ZbwQXSsSOi2KuwjZN6IgwJdFpDy40GFnjIfdKHJFV1IsU
 9L8PqIZSbaQoxbxPVM98uau7ds/9/Vt2L11VmDe5at4YovLdPp+l2YOD8b3R6WbvTdyCxzaQd3p
 RZnftcStvFvZtoKTmfQ==
X-Proofpoint-ORIG-GUID: 56tfvt-wwhJMhHKuwNx1CA8y9dI0tGGU
X-Proofpoint-GUID: 56tfvt-wwhJMhHKuwNx1CA8y9dI0tGGU
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69b02476 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=WKJx3f7KLcD3q_vraEEA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100122
X-Rspamd-Queue-Id: 50AEB251FC4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96697-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/5/26 3:30 PM, Dmitry Baryshkov wrote:
> With EV_USER_NOTIFICATION gone event's data is no longer useful. Drop
> it, removing also the argument from event handlers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

