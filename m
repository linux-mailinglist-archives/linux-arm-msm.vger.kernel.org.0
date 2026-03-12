Return-Path: <linux-arm-msm+bounces-97108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COcdOfcnsmnlIwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:41:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EA326C584
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 503A8300F973
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 02:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B692C0274;
	Thu, 12 Mar 2026 02:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hL8hUD7J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wi8P3Poq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F839374E7E
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773283316; cv=none; b=PTYzASZS6Et7tyNzlwXaVoqvN0jjOkAqsTp7xA82ZVVXuwMIQ+iU0vuxIyeuj7Jwvlit4f/pggXC7MSmRba0Jg0PRv9KCqRQKu3GEH0IE4yAix1wFJdo0b/wvMvA1oSA3KSWjdo5E5oAJf/mqH5LOe8w05Et9ntZp2T5iTHU0RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773283316; c=relaxed/simple;
	bh=PUsjqg9EkBl9Ennyd1av9BE9IQTlXPF9lR6pm1dfnL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHfJyr90Qx6W3yKnNOFpdMXAZkiuh6act8I7BHGdJoBcVipA0MBoE8hS1X3RSGI0I/a93tVdGzhQpHTP18VLKCcl4l72ESnedk3I83NRXb6wNFD3Gg1M27bLDsZI8wGzHCKQOJwVbDqlEQTtZnF/xAPNOYaQHdTtxYO3iUjQ7G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hL8hUD7J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wi8P3Poq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMQClE590644
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jmU4ClKG5CCGIfOUxmw7smA5
	B5pIIKfTvc8wG1R0+I8=; b=hL8hUD7Jk0XNCgN+j7pzLS/lYHXMLZL16ID9IEzZ
	6HsGbIFp52vXlaemY0kZ4qZkD/Nqr6KWjU/N1KAO7QZ/m5XVUpGgYy2v6AlftuND
	3rXUuj1aILbtUJ4vPDU0BjgORQ69uMTXUOXHXw+HRvDAx1z2qRw5uq//wD+IMwgN
	IkQacktSg5TJ3mm7ZLwnC2dAdn2RsMdw4T46gyTjMWhnc67t+zjbbABSM72PudRA
	L4fg0EH2ID/aRT1FhHfkwlrp9lltPclvnCqUq9dbKk12E6Z6JhDQSbUdegm/+vSq
	/Y6KYQaFFxH3ZLc4e9Kqe0cUq9vzVNLnaK5VdtG6mYd01A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh5q0mm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:41:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd91c0262fso366527585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 19:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773283314; x=1773888114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jmU4ClKG5CCGIfOUxmw7smA5B5pIIKfTvc8wG1R0+I8=;
        b=Wi8P3PoqoThsXTDqMEdQMrFo45NBxlQ7JVfX7vWFMB/2dQ7juN3F9trDijYr7uyl3q
         O3vrqC0ZLHaC0xd7XP/UJOUprIpMM+3IgZ6s7j7BPClvcYehZuuMAbPAdi6rTt7A7hqH
         d58JT1VcKNR42SvkPRFLrmi7qtgSMNLliRSMbvZ5Gh9lTvnJpLzvHf7SsheDgKXeeNV4
         b1Ux/UiTTON+F3AZp0+1OEaDDE7c36etzFQC+uo0zB3qELKilrc/jnCGr4J9htb4Exkr
         hGY+1tWI120x6hhoSKEcn+cQCmFH9eHZpyozukyTISt3PqZXgLjrplRAT/YKmS1gkRkE
         UUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773283314; x=1773888114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmU4ClKG5CCGIfOUxmw7smA5B5pIIKfTvc8wG1R0+I8=;
        b=rGr6I6W8lVcP+6w3JqkrLkW3rv6Gx7cM5mUi5/sCshpP10fI+/QJ20nZSgZrQMG2al
         gS0ZMLHi+3FB34S35V6MmEcDp3WvoHZZo/Xs8FaXmeCyFhi89zIfo6vhpz0UmJ2H9Gej
         JD9SzsdJizsIDOvoEgJNRKmqyI9Z9Ji/oL7/8QiEXaSnMc44P4/PfvtqRN+n9dTe75is
         aqFQwjOZ24VA3LukGKR/dKKiPV8zU3Gl1437Ee02luQvE85YI763v+OD30+OPMI1+HsM
         +rJUQu6azoSYX97pqlls+jvORt1w3Snmn335pOcQuLbz5jcQtgcAad8MRTRwCLrqGWCV
         Xu6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXrqQcVJQ0WMIRpai1dI+wTr7Nj/c1DEZ33320BcCDj52z62yuZYg621uld8900F+KWa0nZkPqQto883VN@vger.kernel.org
X-Gm-Message-State: AOJu0YwOhjm2J9PbfiADOkaT2uO/iPFZtA8GFk73bOrmo2JjqY7BnkuG
	DWBXNn1LlujIgvPjda7UcNgfFKZqb19bsUCvnv0Vhr+A6CURl7O2ZvjFqfbugW8XG7r+Sey7g2W
	NGGlxKMc1Knvj/v6b3NVc+kG4FDZl4TgfmxajwHp4xzQkacebKu2upOlxcG7Xweulsco8
X-Gm-Gg: ATEYQzwXmphDAA3SdP/WEu8olcZbRa650YGSuCjQq8GVGmrcQ306Dd4A2IRDpZjL5rI
	Ed3Y1pnugtQiqOPcKqww4aYUhEKfXjpfUwt14Nqkt0GpF8Q4qTFZ0iv5oTzm1lk01sm9OiQdtMy
	62BMnjLKL9CsIcsPca7qcHYg9fdBdyBNsrJXx7tWBAgizARbLVayZblLOA9QUiSkvaoc9KCY33G
	f+P/FzBuJ8CyIQtiGRtZk+6vIFDuJm/GvbH4qrXw6O1L8oWuBD1HV0c/WM4OY6/PLIgnqiWCaB1
	Vys1G8nBGtGfG3B+nLHn8+v04GHxZ8bZ3HUMOM5JzqFJiHVbZ9QTdXdxslTQ1X5eI5YSgvLbXlg
	0PnGhSxYmQqtDXXQaQmNqH+IIlbKq+4AApSHUm2M+i3+01AbhO6X59NtxZ+EsHcAnK1BdtEUX1n
	TO9QtXZsMwNNLam68fPXN+cK/sEmx54Clnty8=
X-Received: by 2002:a05:620a:4481:b0:8cd:7685:760c with SMTP id af79cd13be357-8cda19b163bmr599809185a.13.1773283313692;
        Wed, 11 Mar 2026 19:41:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4481:b0:8cd:7685:760c with SMTP id af79cd13be357-8cda19b163bmr599806785a.13.1773283313218;
        Wed, 11 Mar 2026 19:41:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162aa1sm693157e87.60.2026.03.11.19.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 19:41:52 -0700 (PDT)
Date: Thu, 12 Mar 2026 04:41:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] drm/msm/hdmi: Simplify with local 'dev' variable
Message-ID: <zosmmuo2g36araijttsygpmhujopd2zy5sutzo7i7sfzyexier@v4d2lryv3x7j>
References: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
 <20260311-drm-msm-hdmi-cleanup-v1-3-c5535245f6de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-drm-msm-hdmi-cleanup-v1-3-c5535245f6de@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xTx-0aVrMtCMQlEcjhRAHI7loT3ApoHW
X-Authority-Analysis: v=2.4 cv=CIUnnBrD c=1 sm=1 tr=0 ts=69b227f2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=EFG3vyKGF1DQp6Ot8P4A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: xTx-0aVrMtCMQlEcjhRAHI7loT3ApoHW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAxOSBTYWx0ZWRfX7j/BBFuJOAtb
 +NK+jWUokR8F5TwC40c0KQkKia96MM67h0V57ZJHGSZcgUMDuEAAi9PHX9Na8HlrGZPMDGVNc6j
 8yPU6rn3WxYYel6c5I++P+X0gTMnyifWJv8GAQOaN3bRkrWA8w9B0sgp5Xc8HsIrwps6/ox9W0e
 ShrHKwfx5OHhsqAQdUATtXEppNVXLtzcFQoneJEVIv7AF1UgFUpkFOWHuvy6piqUwkdQthhBsc6
 a/DwHw90eh7PMv/6+/I1LmvgkN/SZjoLJnN8IbdwuyFRwLlJbZjgYxeX9qdvsIY2FooO/YFibFa
 SwnmlkjgOEeJiLD6k5Vq8Ia4URkLxxJgPaUDp3PfWZFeCFnZyAKXiy5QWMgVv8ef5Bn/O5K0O7C
 IaqizmRbuXQ2PFlvE9uB2UmoBLux7/Av4F2E+Ejf4Z2oJZhCK7QPhOzS+/voaIVwtSqwJDXd7a8
 NOUizcUw56hPP9UPjVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120019
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97108-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 54EA326C584
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 09:17:27PM +0100, Krzysztof Kozlowski wrote:
> msm_hdmi_dev_probe() function already stores pdev->dev in local
> variable, so use it directly to make code simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

