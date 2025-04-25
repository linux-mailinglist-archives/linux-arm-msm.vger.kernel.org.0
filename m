Return-Path: <linux-arm-msm+bounces-55578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 961DCA9C2F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6C3B9A728C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3176023C368;
	Fri, 25 Apr 2025 09:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R37HHpOU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC0B235C01
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572082; cv=none; b=GcudtRkXrycs94jg1u3LFnwqvwBY/ck+QPyDvkmDdgL9wn5Ri4F5l8P53/WEUb8Xo4o9wYzliqjU6bHRc8k5xbwOvt+75JCvpouoTvYkFM6BJXFqw2WsnIXOEAVNMeUxyMdssALDAhwTK0UR2IBZCB1WujDkPSGg18lGGT5Kzxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572082; c=relaxed/simple;
	bh=DsjDnHtiCgBweWj2Z9rRF9NFYYy/5gSoExnp430J+Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zxv6PLZJTDa7ApSfkTzaCWs2Sqi7IGJ3aMgl7zW9HLGbAX8wNDm2D3fdXaT9tMZXqjcCy1yjXXEd1P4WNh0OgPzpyB80W5xiiM7mRzolVwjCjtI2VTtcVQktjlohElmoaU1CXcCJZeSCDBYIVfYvJ+GtiBOm6enmIRa0TWrkOX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R37HHpOU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T65B022919
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E7YGT9JoWm91VFNYG/u4ZzAL
	7c7lgU5OKZbu1IKjJ28=; b=R37HHpOUIk4ozHJYiR/Vf6YEkpL6IJnwmqdF+5D/
	Efzded7xua0q/u+CyTp9Zv6jKWBABfo7lgKiFApdm9UcbKC4jIf1amT0KxH3bbLZ
	FLWfEcCHT3wCUpHOqxSJ7752t7yf0yAv6XvetfRfvEKikA3uUX1Yx5HM8+azt9hW
	YQv78cpdaniUK/Bln8YCUxYmNVgQ0UJOsyyrXtNUb3FO/+vSAjCe90T2z5pPzFea
	mU1OG55KJ7uNj0zotoSiZhxPf0x/2Mj4APd9uY+bzL8UGZlotVbymTdvZ8o4b9Db
	zxKz2YpdNGirhCI/apCdUe3tRMWdP2hG2BDSbijWsWmAPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0ggs4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:07:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54a6b0c70so200457785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 02:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572078; x=1746176878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7YGT9JoWm91VFNYG/u4ZzAL7c7lgU5OKZbu1IKjJ28=;
        b=rxieH2d4aAK8D1uEeDYznP91E5Eg+XfZYeOIgxskxGGMvQhUqeN67u0DpJPGEnvZIy
         NRynWaQ+losOwhJM2zxQQT1JE8R8d1mxig7vnDYESGSNTQ6clQ/ugZ6WydRvN276ilaF
         UJTV0vSlR+P1qXJIjmUlK2cA9c23Waz6tJBvYyIwr3PUrPZ/iH2EnAvfB/9tYy698Irw
         LnPc6S6mIulCed4jCbXahlKWmQ1HnMWr+4JDk2McRTEGxTOgUn1qRSNIsrna3NrkCcD5
         SwcIL9eEAt7WGjqfZqF8d3pu0jwqEfqi0OY1CiLk/YSYvU0WbW9NgqQUaNOjWqIICXl3
         iyeA==
X-Forwarded-Encrypted: i=1; AJvYcCWc3LNh/Lu6ztSGs4cRO0q3ApUd+Aou/osQgGrTRh+Z8nfOAmd1S63ACgf2WjhaO/hGQRR4dkIU4GBpbwAl@vger.kernel.org
X-Gm-Message-State: AOJu0YzCZH18raG/XV3AQ28mr9cTXbXd6k28Ri2Wzl5k+27AzVxg3K4W
	MO/kaaSvi+lEbyN32ANof9PHb4KXZUZfVdR5j8DLy7UBw9Ac0qvQiCzBHXpc7o4necKZ8Hi8/O3
	npckvD6QhIKj+IQDPf7boyu7OltcB1vnye5I2W1k2clUfYJjocE33XgA1JJA+byRO
X-Gm-Gg: ASbGnct1H/mWntOXN8oUGTDmqffncjE5Dbi1uLHDD3B1owQK3vDNotZvjBrvQhfhPza
	pYPFpqlalvPsvt+jpQdzmh/N8UXWnAMxwoIdDpVTfkm8ckcDd58u6VG1Oxx0Lcqf65anpemuStb
	4WANUZ9rQNrj68BBtR+dbZ46x53WaK3QzXP2mp0seRgapzF/40eD134BH7Jr5NK+wwuYC2D5rNE
	Pzn/ejjI14C4fdhhR1bDi3PpMl2HrfaRqB1gTkeTHZXqcCmIQWzwL39M10/+9EaCMDPIBIrUupb
	IAxnbzZpo08mIHEqFN01JwDKInLJN0KMYiImvXZCIr9XSJhAadrkzkNbMfRFkR5trYGZT5op1aM
	=
X-Received: by 2002:a05:620a:1b99:b0:7c5:a463:397b with SMTP id af79cd13be357-7c9606e0b7dmr246311485a.20.1745572078684;
        Fri, 25 Apr 2025 02:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHpqKgmY/joCABcKakjj51b/bf9LSO5bp8KVEFf7NSYBd5yr5G0Dj8JO9ClMIekjeU5G8jvg==
X-Received: by 2002:a05:620a:1b99:b0:7c5:a463:397b with SMTP id af79cd13be357-7c9606e0b7dmr246308285a.20.1745572078331;
        Fri, 25 Apr 2025 02:07:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb83dasm520591e87.249.2025.04.25.02.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:07:57 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:07:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
Message-ID: <cgog34zs3e43n23mkt35swvu2ibuoaav4ccrhjoizg6b4kgc63@36blexv25aud>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
 <20250425-fp5-dp-sound-v3-3-7cb45180091b@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-fp5-dp-sound-v3-3-7cb45180091b@fairphone.com>
X-Proofpoint-GUID: 51a43Kjw8S1XMMhJ3UrQQ7hrZ0HmYoJe
X-Proofpoint-ORIG-GUID: 51a43Kjw8S1XMMhJ3UrQQ7hrZ0HmYoJe
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680b50ef cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=EBsx7UlYEkoSbB8InyQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2NSBTYWx0ZWRfX7sECIkYvt8wG GUtfm3DpUym5Gn2yZlsJYHEgNWU95l64FoEYejVzzfbszPUkoBEPSR2KuLu2sgBU1qXNjGSk79x JyMGGpB90RmcZtMGRR8KbEV+WhryIkxft16F2/kDCApTguEjpfyovxaAOGQCvYBV5TxCwMyUeM6
 78o0Ko84VbQHb2l5/yab5P9AsqQWWHSK0gu0odRTYBxw9BRWn4Wl8tWqOMK5tPp1kIEejxu26WD YYq6JfkFxe+tpANYORoh4n1zsU8/sIFYjaXxhSuOAoTyS3oHf4iEX9zv+QIbJfJGiy2F7Z4hmAX 8NOFOc2FJf/SEEwQv0PcCDS9OCfWxCjdQPffgoQ2OUOc5HyZO1P5ESrgaZ6OKFoOP3xxHywd10g
 9cBXhnr5gP5l70on9ZZSvAmPepS0nPCwYDG0wtZ0uB+nCjOaHbjoVJpADOE/qsXgwvUuHpH8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=891 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250065

On Fri, Apr 25, 2025 at 10:07:27AM +0200, Luca Weiss wrote:
> Add support for DisplayPort Jack events, so that user space can
> configure the audio routing correctly.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/qcom/sm8250.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

