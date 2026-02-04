Return-Path: <linux-arm-msm+bounces-91800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAgJLtM6g2ngjwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 13:25:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E3217E5C1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 13:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6E950300290E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 12:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D80A3E8C60;
	Wed,  4 Feb 2026 12:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xvz/SIeO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IkuJVDN4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC613D7D78
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 12:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770207944; cv=none; b=OHbr/6W1JxsoFQ8snSh3P1qJ5QAYA8rZV6ADUo4K1amZnRJUWlpFK+FJ5YCzMzSlKXtScEJVaaLec0lz13ByCkJ8G8MU8VtWXg6Z/9fx3EALdDyYgIjj56045iboEiOgKy+8XdCxkX7v6d6j/WaTk3LSRfqe/ptXTuYoZhobop0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770207944; c=relaxed/simple;
	bh=Vpa4oZEPwHEXNRUuwB40+XgJ/7dZ1lY+Ic4L3+YqhoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AorULUM0TCXzwzDC5jxm3XCt7xjU93iEs/WmchQM9GSEX80RMWktY1LQntAnVTPe5NxHbSli4/5K/aPmq2oGArLdnz6MWz9Najsve8l2bRpObCpon6lSN0k57IUKAJzR42focpum5N2/Ahf+cEkmJ6tm14ne4dmnJ2fVrodiorI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xvz/SIeO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IkuJVDN4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIVL32163416
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 12:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7pWRR9YZN3Ri1woPhiOvkt+yX0CGEmyVVbUstcmldG8=; b=Xvz/SIeORgR3v2km
	0K9jULzUFndKaSgtOJ4lu+81lHNYp7GYBvZf+533Gv4G+qEHvRDd+qcLzDMLTVHJ
	1I1UnUPFI1r2VXGABm4CeTg2I1oAJ4ODyz+29fp4UxHgOTUVVSVfuqoUVw3kON9x
	6uq3i3P6qD/aBtClBTy/FanCbGb63u7DhUt6Dx4xEe7Xh32+HLoHezIIuUUc6a+7
	hZcI91gyHhfcHUfXYm8IePO5o82tRvDgFQ3Gsyf23av7Ias4MlDLYvF4uFy+I6wK
	NT5WHmLPYOxB0VGP/cq8VCZji+baq1GES1QoCkCHBlZQGxLqkOKaXg5Qopm8mFis
	H3hb1g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c45nvg2vt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 12:25:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6de73fab8so202357885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 04:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770207942; x=1770812742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7pWRR9YZN3Ri1woPhiOvkt+yX0CGEmyVVbUstcmldG8=;
        b=IkuJVDN4I6L3rnJj3uQ5rKeiKzWbBxzh5VkedLbo3ZQYQO36CozJHf4XeHmcRPj1KE
         etfoA+pOAKzl2M+qg3Yd9QIIGnb53i0fglAw8SzZ9eOefVcg/7y8OW3jyKlq2FT/JlZM
         icC3SVnjVjCAiVnp39X6ixaeeCxOOtDLxWIFgwmnqMbty9+48XWQ21oo2+cygYrr5MED
         IQOeVNABH06o/BppD4RRTrzVOPq+lRfrtgZmKwqM+U2TjC/82Mpd8qo80EDoYcmqy35N
         ATUW2ctw2PZ2J921GHTeV9jVurGnlY9L3Lw+LhLi+0EqThnKpfojyPN1h4FkZzYybp/9
         /CBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770207942; x=1770812742;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7pWRR9YZN3Ri1woPhiOvkt+yX0CGEmyVVbUstcmldG8=;
        b=IBY7fFBEOLkswPx5M9dKXikn02pGsxUYzeKIGGrQ7ME+xRm/qEdLuIbb+iQIE/u+kq
         YG7/IYzhAISASbkXWIZMraMpL6sMyCWEVcHDeWwxfiyOKSagzVSoPVy9GpMUVtAJnUZ8
         pWdh28g7idpyQbuaKjRa3pQVI4BwwBiz12fojF+FM2rJyNBUYa0OAKpsqeDp7JpU5NqH
         6CCNXQYpZ65hAwyyECdZdBt40pkH9Y/DzSqaquGigZ1lKN4lmrQuIqVv82hYQhFiyBks
         o0xudGH45jxYujuCQI4//9ekriqgaEEt2p9/6v5i5ueTTC+nYVvMatOeIdsD4b6hddwZ
         QHgQ==
X-Gm-Message-State: AOJu0Ywq7nl02mWdLzPSFPPly42YJHjL6HB6kJm1ZMRwVvilOP+g1Zih
	AQZcOjGa9MjqgSMJUHs/qJxfJIkYEEjikwDc94p4dHdi+I2vswH/V4ZhfRU+fx8ke6Bv2YpGlvD
	7ZCVbMzRamDX/YUb1DqqEs2l9StRejvk3UDKP/Ne9wEB+OWVJAltNbI6b3/CPv6skEW9r
X-Gm-Gg: AZuq6aLvQMzDb20atdliMONUucOvAZcLEL5hMjpkARDXF5uCufwLK+1qHA7jES98YyD
	cFR6l2uZFONTZqj7FeQ6JdvcWHgKVpvxGSKWLxb3aKmAyJ+PkMhLSD3IMiW3FDT4hlTnhaTn6Q4
	GEhmkLYRRANeUVB4iYeN//LtCGu2QSqRuRBtaMp96TeOGNxUZ21nnQZo8K6m/ch7trwM0rPNYWF
	l8L/AJJ86QgUypY3aKcAe6uTUG0oSQD43QQWo33uxo/AJXIGHsoRd4hGNRdwk3MwhKQscDn+PLZ
	Ca49H7Z1XcdhPdABvxxv1nbzK/tELMSyeFuMZJHP6uLGAR4VSm9EtAztafD3y5LIoEnJ41+KyLD
	m8IB8+jcRQyDLqWwln9GKIbuuT6hmaOhb1kDFIXwjHcEsyzwLLI/B3GRLhLG9RjFncek=
X-Received: by 2002:a05:620a:40cd:b0:8ca:2e37:ad06 with SMTP id af79cd13be357-8ca2fa15b1dmr280287285a.10.1770207942347;
        Wed, 04 Feb 2026 04:25:42 -0800 (PST)
X-Received: by 2002:a05:620a:40cd:b0:8ca:2e37:ad06 with SMTP id af79cd13be357-8ca2fa15b1dmr280285385a.10.1770207941893;
        Wed, 04 Feb 2026 04:25:41 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea0021b3bsm114669066b.49.2026.02.04.04.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 04:25:41 -0800 (PST)
Message-ID: <8cb4b755-9224-492c-955d-415585cbcf99@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 13:25:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 5/6] arm64: dts: qcom: ipq5332: add pwm node
To: george.moussalem@outlook.com,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Baruch Siach <baruch@tkos.co.il>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260204-ipq-pwm-v20-0-91733011a3d1@outlook.com>
 <20260204-ipq-pwm-v20-5-91733011a3d1@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260204-ipq-pwm-v20-5-91733011a3d1@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA5MyBTYWx0ZWRfX+QKYCxHDmirv
 QrxJfcfwlMSM1KduX2EosWVyUrlgmvk7qy9wxXUxmGbkWuWuZmBmgq/1BYSuWlCyRGfK5j1vxxM
 c/FOdd1h35VfhkxqWYoMU9rGC28HfRjgyx5tf2rie+geLjx0joZklaA64X0/S385ioToQgSCaQy
 eAXIpWdjKndChyCsLY4oa1CIfD/4p6UQfkOoOcH34oqOapQ/xlECjlndEP1jx0cAVuGwZWhK4rr
 9MKM91CugrjyGWUyMwg7F3CxGvQgI2bHSwSxS/bG1j3iUmRfM33yVpCGI3dswZ0TjZSGLVv1dgz
 Nzcs98GAmBI89S6t4Jd+9tvcLNA3csTeROyYE2nU8BBk+k+LaTfBzAcrUZdznVw5D6KnGHYC7Xr
 8rtBhXaiPBbKqcJyd7rViNxPpQCnp98LHjfqB0QIb6K+eJKoQKV5e4h0jk2lbqgAId370UDx1I+
 SwrTdO4wDcMrtJqA9NA==
X-Authority-Analysis: v=2.4 cv=DLmCIiNb c=1 sm=1 tr=0 ts=69833ac7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=W8KEJANZPcvdmftmyl0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: h3NS4PcNZLCFWaXCQMRnxxLFeOeEWgGi
X-Proofpoint-ORIG-GUID: h3NS4PcNZLCFWaXCQMRnxxLFeOeEWgGi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_03,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91800-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,outlook.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[outlook.com,kernel.org,tkos.co.il];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3217E5C1D
X-Rspamd-Action: no action

On 2/4/26 12:25 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Describe the PWM block on IPQ5332.
> 
> Although PWM is in the TCSR area, make pwm its own node as simple-mfd
> has been removed from the bindings and as such hardware components
> should have its own node.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

