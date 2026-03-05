Return-Path: <linux-arm-msm+bounces-95591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MlNDtxbqWkL6AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:33:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A27220FBCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 807553055DEA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 10:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9615034D91C;
	Thu,  5 Mar 2026 10:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWZrYr25";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a1684thz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FD837FF65
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 10:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772706546; cv=none; b=pBLh/k4wRfbAxVRzvavskFiG3aflLC2yToQifUzE94SZhU6NTvghClL6drrjIXeqFqkrp0LAq4oLPRUgcfSSqnYhTWCS4lnsBPOiDKANFAVnbjtUWkF7hl0+7OrsIyYJtYgA/lUWhNQr6RkPe1ITwrBDDzgVfteAmcvupjohb/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772706546; c=relaxed/simple;
	bh=E/WRv2FaRmf6XbiEebeQAmIVI6qjp7ukCLwVrGtHves=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BMJlc36i905+03VJvSGe24FuDmUew6n6I0iJkEEqgInwTLslAlfrUw1d64Sq9ZiNIkGMEtAJ0cgdVr9ImNs48ZrHBKOYo0jDYf6uyIaocCj0bs4o5IvFNrH3N98+tPTeFjcFAT2pqzK/m3e6f6r3j6v0kZK+vp0pdjAq/Z1aIio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWZrYr25; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a1684thz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFiJu917147
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 10:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Je2kLfBA0eaKgF3s1aSk3YHEedUIxzkfsmlbL2qkIOI=; b=XWZrYr25yb7DS2Uu
	r+cy9yUJSvwGM9xThCF395BP837XsFYValw+drEE/Md1E9OnwiUTOxMWcRHYG+Z6
	5BLrGu+2tycpxuyYmQGQlS7oMK9kZGcRvTnUTxHKLyOwgjvyJe+NoGvWOTtcztB6
	yDPFjmTNUPXwIAJbwM1ezaCmhsva5NHFbL0vSspYE0N7tteYMJWOybTDSdBJp5S1
	5srmD+RWy4b4N3Vy6D+QbwE5RUITbnLpwug0xrLZOA+CBZ+BJjxhpQ0W8NjXzAwl
	PAfr0H0VlXyoAhzuINmbl8uXeaHyqW5Tv+uY8FfOFou7+Ih5DhuKC79H8eVApIWy
	+vEmXw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq380s3ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 10:29:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c7177d4ab4so648454685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 02:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772706544; x=1773311344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Je2kLfBA0eaKgF3s1aSk3YHEedUIxzkfsmlbL2qkIOI=;
        b=a1684thztmhTJwf9xr0SR6M4wcGKp3LH/+95JY1mbWpzvmZNMCZuPxfmPzANpcG/oj
         98oxZOTA2kH1KL2IIXzDyK99rrl3QalPXIqr0ixgeqqiXyFMIbnhOUz97Y7a5NhtUIt9
         +/YoNdMkSpXxQFcSdIlNAUSITNiWeoQC/fCJIhR81MBYg8Dfbe0HoeVtgSk1Xm9Z+Xuc
         yJdu7efcGVtQFX0+KBhVooVpn9+NiHVqKc7EFdqVf/zyhh8V5APu/FKUz2Ucw8yfdpZo
         rOR5zr1BGKRw6i634X3r+33jLfwIs/paGHEHG8zYueACG+n7Bqw87y4Lagx7hTfOeLav
         yKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772706544; x=1773311344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Je2kLfBA0eaKgF3s1aSk3YHEedUIxzkfsmlbL2qkIOI=;
        b=kAg8Ksf6pO3I6mp74TKdJpF6rceox5AlvQBG93ZoJgWlQ7hOVdNu6yCG+AW6DrhGZI
         oyqKuOlCKZqEu7UWfQTsLCd0AMkPvR1iId6aBCCGkIAW4JguhGDNcdJOCtqpVZV1zH74
         U3HxglC/WD83B622PYj0VfWS/vi6R3/G4Bhn9ivMIETRB5aZvVS/bFdp8pkOjrdfAN3c
         EwvRzLEaabVgBthd9Jmm16hvcqQ2wbs5Ez6ZJq3qgYLWqwZ64oEaU5zx3LcrBWFDL2AU
         fGdxOgvDpxOmJLlHz8CFKltI1A0j/PQesFzevERpepw/JEyp/arcyhx06kK/IK+isfjs
         Qn7A==
X-Gm-Message-State: AOJu0YwUvVDcGoIUGHB+QdAZ8z6vzvxIMTHP1VT7F98mi+pLeHeQd/f0
	aYZc4F6kmIGCvmdNos1zKGyAtxtml5NIvrGp2xK/ORTOE4dwAgbywUvwF0/Wp4UZ+I/QqkAjhBe
	Zgn+gMdvNsTlFG0ojGXoWNnfrSk+9k/eCWHggj6GgHzIrlZOakjwk9z6PIt2BuP0ylyso
X-Gm-Gg: ATEYQzzcT6jal3ZkViES/3q7Kn2KfkFiFqaFblK3D3w1LBC5T42EoIcDMi5XQiJ3/R9
	+CoAOvHxdji13mnjwkH2XO07ewdOA8gnZBxaVqgPiiYp66YuGDMgDXiPiObWZW4oMV7K16CeH+s
	K7q0a/c0Sa8vVZsddl2GxW5sorPcpmx+m57skrrPHSsdp5GtAEJ+qCLw0+vofEmooI9RkdFkW2w
	tWcE/MPOXjV1HVJ7MhasiF5qB+EWLETdfjm3aCXb7LD2OatVJttNRiBaFXBC5dUgJpPjfBncQ07
	8OaTFUdA0FOvXRb7PH4tqUa6LDMkJm7I8g0aZ/frUnQ3AY94DKd8tyHQyCImfJpyNrv4P4YSRIu
	e0gQMTtnE1uo77zXnxq+3heQK3QJsPCYwQY/sADIV9DmO7p8tthdKBF6tqisPbNB3hEnRn5wDRa
	+aCrw=
X-Received: by 2002:a05:620a:1904:b0:8cb:3fa7:c4f0 with SMTP id af79cd13be357-8cd5af866e5mr505827085a.5.1772706543758;
        Thu, 05 Mar 2026 02:29:03 -0800 (PST)
X-Received: by 2002:a05:620a:1904:b0:8cb:3fa7:c4f0 with SMTP id af79cd13be357-8cd5af866e5mr505824585a.5.1772706543313;
        Thu, 05 Mar 2026 02:29:03 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660a55b191esm2641468a12.23.2026.03.05.02.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:29:01 -0800 (PST)
Message-ID: <58814d16-6638-4f8e-82bc-67452f6faba3@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:28:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/msm/dpu: Correct the SA8775P
 intr_underrun/intr_underrun index
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mahadevan <quic_mahap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, stable@vger.kernel.org
References: <20260305-mdss_catalog-v5-0-06678ac39ac7@oss.qualcomm.com>
 <20260305-mdss_catalog-v5-2-06678ac39ac7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-mdss_catalog-v5-2-06678ac39ac7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I5Johdgg c=1 sm=1 tr=0 ts=69a95af0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s80QRqCtEMuw_QvzVh8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: oNuMCf5VHf1W9Twr2DCpkHA237OLdqlq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4NCBTYWx0ZWRfX0F2E0lVFXUvV
 9sM7s3MB1PHPfSgIm8WxYxJ7EzgGIKJejelXyx/LYxmk9k8R1HuFjWvxaNFYPMu5r3ZEaYFiALc
 0DDMqd1N8iW/yAucZVxp0H1CFZBPy/Of2MSTEaMzXJVEp6nK1NKITPmjpqsx1/JPMOrOaSvrFxE
 yGU2Pxz5+VYohq1BgmsTpuPcb/5U8+7lsGAtr3ksK0B9SZTNxlSnPIDFD+XgvnBPvTz+WMKdbl+
 EN1tVAx/00zlN1I6yAL18VXNPrNWfkX93D/3OkaXSZ3Ev8pTtgCShX/kBzZ0xxRa7EcY+lm4kM0
 7hAPMfl0VqjkkqpLGjM07/1J/Yq2xThYMB6bO9kw3fkf+2JxfZ1FxhbwZM1eoj9jZWnn5TtKecJ
 dyNoz+nYIijKmmmGWgTwja5kgeikjBNPRbD17cis3TXk0VmaUBMOnLoktB8lFhNpc34gO8hY/4u
 gPCGHInTCIZJWCeoFPA==
X-Proofpoint-GUID: oNuMCf5VHf1W9Twr2DCpkHA237OLdqlq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050084
X-Rspamd-Queue-Id: 8A27220FBCF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95591-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email];
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

On 3/5/26 11:17 AM, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> The intr_underrun and intr_vsync indices have been swapped, just simply
> corrects them.
> 
> Cc: stable@vger.kernel.org
> Fixes: b139c80d181c ("drm/msm/dpu: Add SA8775P support")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

