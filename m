Return-Path: <linux-arm-msm+bounces-109274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHs0DLY+EGrzVAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:32:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F425B30A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 664CB30209C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23353DFC64;
	Fri, 22 May 2026 11:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YF3biwaZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqXWwoRn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AAA3DDDA5
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779449315; cv=none; b=j90YIdu8CcclbNy8N89Cv4mB/vBoGxMbikZYc7ATctidd+WhGGSwvfz1EjV35ly9ej9k2y1gVIILGTVfflcR9/uJz7/VbzWzvj7I1xphyLvUt1piAirGB/Pf5/lqUtsqOYouUYK9nuLxwBK/j2kPZsr/lYJpj3eBZ7BCqO3PVPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779449315; c=relaxed/simple;
	bh=Cdd4tKsfok+3niD6n/a+ouLSb5OrhyPTDw/6/YlU9qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ggPgbhLUs4J6+vUP3bYp5Hc8j7osUkPifWKy/7x3SNrzwvo/z6cEcxMEm4/qHrDMD3ulHsPlikuXrGRaX8AR2fzQsstXCG/diWzEdH5QIunyOLHC1ISCrJ4PSI7oGiuTNKG7q/0+BMzqgnuiN5FTmrASdk+WAQXC+dEhAh59oS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YF3biwaZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqXWwoRn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA1noX312832
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V39PQb1fgCsY5OB3p3CUoPFehh+XbPwwIIvuWqbWIR0=; b=YF3biwaZd+MbDKPh
	ElXPoX6ojzP+eejflsrrvCVolhpHXE7nGI/JrvIkZzsetNho4BaFrnmJA9Wr0ppP
	0t5xdm5toxI9MtHGINQb1nZkRdrR0IvvUngQp8lwkLj4ghm2VAfQL17YAagkgPCI
	WrF1k/ZZy0U4PfDFeVsgC4t1X9qHXagjC+jwK5MR4skyGz9i+ZTwxWbRBPCTJPAN
	9RQRG6DPFopZnuL41SEie41Ks8TKu2WoEIAdUqQCV29u/+gcHAaKUmnuixIaUQFy
	/5EMQy7KfpOFzzmOa7+K1rTTdlJNTHv8lo/dwdZ6Kwlyuem7sVO6VynLdzE2lxI+
	lysd0g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea8833juc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:28:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8b026c4497fso21389386d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 04:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779449313; x=1780054113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V39PQb1fgCsY5OB3p3CUoPFehh+XbPwwIIvuWqbWIR0=;
        b=iqXWwoRnEA/5DXonwVBBfWNNrkjmu5X8z/9NUm9q6uZF51dUtRwIdLQon3z4lQXr4Z
         /8KWa3wiEkbCPul4xR46KhZeVw6VBp8dX1NdC2MhIrvYkgBcKoG7KHV036xbXe71i1DZ
         EVcVfDhdLWV1DrlzPL5bTNnxuvZvExsdjnLkvLbqIQbKD+LxOc4CnhHGJ+d5wp2MvL/C
         FxC8qYjjC7S/znCp+BY+PduDVd3yi4b5uqRK+FNqgZqh/Qux5SaYUhTzgcsUo2/fKz8Y
         iu2kDXwHsroyaGoYY0MaAFMVJ4LibtIjof0azX5k2fLgWC0X+KmRZzTLRbzTwL6NEOFe
         DJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779449313; x=1780054113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V39PQb1fgCsY5OB3p3CUoPFehh+XbPwwIIvuWqbWIR0=;
        b=CCf8B4iv6xY0VyYvw/sG9JgbAQgDxse48k01h5uc9REV/NZ+mjHQuj3T/tRFh38f5a
         rg0udibbA+E/ubRJfqTdMdjeLwtHQTANJPWKWZDwAALITPUgBMMPpZY2X6e80wU+OdNR
         lvdJ2sLDiMd2mZQBWm9Tz6W+Jf5N+zKWOdy6KsMfoCTGHxVZUsfiopjPqu+B50iWOnfx
         HQsGTL0M68oDRiai0WFH4r3PQgsq39NxaEJvYc5MOHRrajYmwlXfMxIU79d7UwyLDkzy
         ERQN7FbA437bLTaIHv8k6O2IqeBp516Cw5Yp5RS/vYI5UiixlYBLJtDarwqbPNJ4IwLK
         WlRw==
X-Gm-Message-State: AOJu0YyeM7+3r3rGEbtyMpejOcGo5nWbYvp8Wj1ciQOeU6/9dEgO5QeD
	sa7MmtNVl6VDUtCIWtwG5BDd1LRzzS7Oq2BvjwRd027jvK94oKwNJq7Dkh3ukp4KwI0bJGZK3NZ
	11I9PT+tUvdESKnDnnpbKuv15F4Ya0E5WiX0HKrSn6LDiPnWhEvS7EoQ8FbCt/ouoKP9+
X-Gm-Gg: Acq92OG/6hu1QAG11lJuNfa53ZltTWtGqnjJYKfGJDRTq95hx3kx9ffYdwE6TwL2shL
	Kfz4icy1Xmw4t0x1UKMTqWj2vYEh1tChrS1qhZ57Sy1EgpJxOiZQN8lNczpGWq6Tva2sKrmEIpf
	yUyHsSiZfCOnwven+wNkvNytW+IVMstOljpQC0kZDY4mfoQ+iUpZBBiYvIf3h+CC0BFfdgQN1n8
	CiKV3HIZI7fyB9sY0MJdwA99rbpjN4XT6u2/+4gXxsRT37higLEIaDqvOS8rQM6uJnYGIm+xMzs
	xZ8Z9t5yu+Kfzx0yNht1LSCnJ9vqBRLGBORSaNNQjRilyKZtdYVkA7+8yOJ9E1JPRyjY26r03rg
	/qOzw3yzRJh6JZhdLhSPRoPl9Oe2y1G2FRNU+QErq2XEnww==
X-Received: by 2002:a05:6214:1fcb:b0:8cc:85da:2d90 with SMTP id 6a1803df08f44-8cc85da2e21mr3579586d6.3.1779449312935;
        Fri, 22 May 2026 04:28:32 -0700 (PDT)
X-Received: by 2002:a05:6214:1fcb:b0:8cc:85da:2d90 with SMTP id 6a1803df08f44-8cc85da2e21mr3579186d6.3.1779449312389;
        Fri, 22 May 2026 04:28:32 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9f6084fsm590899a12.11.2026.05.22.04.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 04:28:31 -0700 (PDT)
Message-ID: <792b6446-53f5-4324-ad6b-5bc9a88e25a1@oss.qualcomm.com>
Date: Fri, 22 May 2026 13:28:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] drm/msm/dp: fix HPD state status bit shift value
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
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <20260314-hpd-refactor-v5-1-0c8450737d64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260314-hpd-refactor-v5-1-0c8450737d64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExNCBTYWx0ZWRfX4iGJ9ghPwcrh
 1tewRSlywGJUnoVdyx4pWpWXXQO2qlo5SWFQ2Jhw9x8yeMLrlTSxU7sw3T1wtceYPrvZ/CcKSQy
 Vl4iV8fVPXLDuYFIJJK+OyyRb6H2Rsw0l1bknO8gxMMvkL1M5IhDR3aYs428Bp3ywxWPnXw27qM
 Vy4tuh7n3rVCPu7ntikyXIvddoGqt+WEvr6y7IMYHXXuyv1FHBRllz+VMBL9KvPbz9BL0r5tGMs
 d4JL5R6p6YW2eGY46v4q61F7bzFdal01KTsx3N2YmT1bfbW4etsV2mNVCjxNqVGM2SrHxoT9G4g
 IL1JK3zweznqQQx+rLfUPIrQqXE2lbsQVbwnNn7Pngq+2NkeY5njEg71ZFfuKjG3izRWu/G7hDf
 tgXa5WdUMc969zjm/2lghPJFbxy1nK8hYOjxbjymbngHICHqdCfXPNYSNwA1AaJkjZ7iADbDE+o
 6EVMEVHu1RTfNCnnxWw==
X-Proofpoint-GUID: bR76xYAG0M_Fd-rhZOrUpOusnUl_v9Sy
X-Proofpoint-ORIG-GUID: bR76xYAG0M_Fd-rhZOrUpOusnUl_v9Sy
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a103de1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=5rTfuJP6cXs4uNvNC2oA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220114
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109274-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 19F425B30A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 2:09 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jesszhan0024@gmail.com>
> 
> The HPD state status is the 3 most significant bits, not 4 bits of the
> HPD_INT_STATUS register.
> 
> Fix the bit shift macro so that the correct bits are returned in
> msm_dp_aux_is_link_connected().
> 
> Fixes: 19e52bcb27c2 ("drm/msm/dp: return correct connection status after suspend")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Carrying over from v3..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

