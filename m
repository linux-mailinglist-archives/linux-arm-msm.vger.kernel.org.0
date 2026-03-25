Return-Path: <linux-arm-msm+bounces-99914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE/sOHEbxGnlwQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 18:29:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9073A329CED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 18:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3191B30420B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EEF83ED5B0;
	Wed, 25 Mar 2026 17:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cPnzPXf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fBJ/JGBL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA223C73EA
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 17:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774459066; cv=none; b=apQQVJ8vL5YSMA9uqwYoPMfb1vZpCLlOL/rKdJoqOkEqbYR/WmfvmWjdIQJ+qC0HhbHddCK0+aFNNG/Cds4Kg6ba46xzQUymSuYFmKgXirMOwpiP1UHo9Np+lAUTsX8UQotGCd7jLdfzqAshPiGef3mP501gouZWVwcR5BPrBeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774459066; c=relaxed/simple;
	bh=DUeYUo8v2hrG8TO/xuYnnbrW1r9eSwbd9072+pSakI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H36I5/AtcCwUezVJsdL4i/cT8SfNxWNUps58QkgP4TKmv65ee1nH1jyIP9KhBsvZ/GE10BMxuI7qrcDzP6NFcKh1FwSEyBjAJBnZadSEjdCCGRjCgUCAqTk3t2LA7I4avlzlt8E8AK7uYTJqVs3H/QSBtndKhQ/jrtnuJfjdv9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cPnzPXf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fBJ/JGBL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH2d81257937
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 17:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T4wGSBtw4Oq+7FiM6cxcwXwB
	JwT66nkOPrc5ssKiSsw=; b=cPnzPXf3LuOAZTFFQ76uGhTtMTKKaGRkYK8Zbzyy
	RelwctbN+yrwSohdaMcOxrW2WLe/+D2OGudVee0GDbdZsAjKobNbTslOxK7chksJ
	7VlfNSjzS6VFSFByvYQy4Z2HAOgTvIiWETtrQ/Ca0S7rD0RdjAWM8nSQOvV26Bz7
	prDP8f2QozwVWo3QXvJKU+nXzjeVW/c4uFpcfkDFFzReN2g6zqMR9ucpj0y5zxi3
	ma9lk2P/i80H1Bsc4T5Yhx9WVc/QlLX2jaesF6RDQzSvT6yzX987oXSIaBdpKY80
	X6izwoPhikT64PHPXUdzpzmaXISB6Be0/HsZbbX6MPwTaQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dm2skvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 17:17:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4987c698so380281cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774459064; x=1775063864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T4wGSBtw4Oq+7FiM6cxcwXwBJwT66nkOPrc5ssKiSsw=;
        b=fBJ/JGBLVxxnmwkj4T4mQz6aSXNwTw1ZG2dOTrntXAuWE9AMWd2z4MvvvhwvpB1ILO
         HbIxc60EJkY8pnwlBshkfFTS4kFMZlPsuOnptX5FvnZqN0yvTgMlhJ1FkyOAGPMUyp/L
         9FlI11uJ8htavkSAkzirn7TTv82A6AVZJSS7J0uZlR91nhvwWRptczAwI5/Co9y4bPR0
         nLiC1BEf0vUdVKIHXHoryhOMpihUvub29o9RsVun9sdniPu1dDVWPaWVkWH9qBs/n6kt
         jaZ0pqaLsVeOkU0yvJRPgLct6CQYPsTvBchZg7vuhmPBGtUWmqHUvt5tMri2VBsqZ0Sz
         Hhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774459064; x=1775063864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4wGSBtw4Oq+7FiM6cxcwXwBJwT66nkOPrc5ssKiSsw=;
        b=qKi0uAzU0NleNFFWPohxQfCyWVBiwAfzHfQU+/jpY+yjjSRw3772PW5OcX+NlbWY7N
         MsAPH/KbQdKVhdXhc5JL1gJ8iyiWNqfwRRTsSaahaECsaFWnbQQhSf1bEQLxBkGiM0Fc
         TZK7RU61dKEyYX//n8c5Ga1TGUgcWc5k7uCqwRBm0LS5c2U1FDcz/UlRMMMPfm0enmGT
         NI6nAXipmZjz9BGkhx6qP6/vCA6MqN9cgj79cWSBftLmfRpFxjIjRe2/4KRFAqF6OCQG
         yMkz0QKXgzl/kLAE6MSbuMfYhLYMOVDV9gWA5lB8C46pWAi7UjCiKBJIAMcKtiYbARt2
         elaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVHFNmnkLljbP5dy9gyL+Z8c62M0Q9eSrImchJXcgMBo8NHY0hUKgYp0b1LOe/+uBEB+cnEP6/PreBwOrY@vger.kernel.org
X-Gm-Message-State: AOJu0YwJyaEvE+kV8s4R+M6sJtA595PCv2wb++cH+ww9jX0OeKSZJw+2
	eK+frh5qAYx+HLMKzWsNtmWWQ4PUEPBgMmjkYk0piSbL2SPn156VN6MGQgQO+Mf/bSDu9QVZ9bq
	WqmoqZPCSRxLO9QFtiMhnIAVmgroNgjsKANMOvsUbr3Hh+FDQ4ZKjcPwlw2dHth4BXvDKrDUG+u
	9J
X-Gm-Gg: ATEYQzzobwDvnTcMI0Y5Sd5UXU7NwQkJjCv0LJodrn/sH1da0uHIP4S3Dls5BoIFe5U
	L3D89CfHEYcA7WQJdLWSFVQM7+1uzLjDCM97o/7Fc5hd1xkBMKUJS5r8vuuIg9hI2R7wZfCudJ7
	9dOsadDecFNKJO6XsG3tPQcASepgvFizsufR4vH4sne0GbO/oDGfo+QJxbyEl9fgJwS2BClQADJ
	MjJL0GtYKXO91YbW+UgoDpSZg3et+TWx/tV20CaBaE9SrLTs/zpGAAz7rftLZVJNh5w98wtYrAR
	0KslQ+EW3AHcBGzOOp2cl93BneLJwH/NAn8MxtnhFQysMCKx8MnavFtrhLDzLt9EnrE1Maqhx6X
	Zp0od2wMF5r8XZSm1UXKwqH9Mf5GBkBxBVOodz5xjoS03ZsUVh4nutwD5ukvvFNfWO+WfUkvc/9
	6SuUrPZGcOr8EXpCNTjLu//64ZVauD+Rs1EOk=
X-Received: by 2002:a05:622a:8349:b0:509:e46:84ea with SMTP id d75a77b69052e-50b6eecc75cmr86464591cf.34.1774459063946;
        Wed, 25 Mar 2026 10:17:43 -0700 (PDT)
X-Received: by 2002:a05:622a:8349:b0:509:e46:84ea with SMTP id d75a77b69052e-50b6eecc75cmr86464181cf.34.1774459063384;
        Wed, 25 Mar 2026 10:17:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a068f8c7sm27169e87.65.2026.03.25.10.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 10:17:41 -0700 (PDT)
Date: Wed, 25 Mar 2026 19:17:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: lemans: Correct QUP interrupt
 numbers
Message-ID: <7ifkfgabmhkap7vnwewajmwtgptgioapgszj2klswqixbk4nex@f7nnwfcrit4v>
References: <20260325-lemans-irq-num-v1-1-a470d544966a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-lemans-irq-num-v1-1-a470d544966a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEyNSBTYWx0ZWRfX6a8V4yxFiXsj
 Zb6Lb30OlZm4ss/R8/EaOoibo2M0bwLbt+wkPtIPRQBlZnIJZTL076NWkVy89cYy1xAYXyRS/WI
 X+aX7dWRW5ZVjp3gMEcNK5PghxVZ6VyMUNwBvcI34y/wx2abbYER4y1iiA5IHJLpdvtZh7FQ7Wo
 QX4irOWWYmPmjOQI+0WGd2N03rOoSw8FuJHuq4y2UEpBVJ7iqVFVv+cd7Z/FIPHOZB68Et+Ibaq
 md3A4V4f5au9/MJUUsrbyEI6RnmZnFka/jomXP9wyshW9e0VDyGt+NTCApnANdSEStdUI/woXwY
 PijCSgL6qCgLjpsJ297EX1lpUVMRrkBu16aO9Y0YkeohfTHblQGnr+ekkuy2KPuEN4s7lMG9APK
 s7PYWfTThTiVe2VYq86+L7X0xC7p7nJxtY+9YHGY9RIzVHNusr5vfoX2nxiFwEy322rtAFYT7/Z
 kx4Y+/p55Xwf5mUzLmA==
X-Proofpoint-GUID: V-yAbidxTbCUyIOoyZhTzeix8rDhyPti
X-Authority-Analysis: v=2.4 cv=Fo0IPmrq c=1 sm=1 tr=0 ts=69c418b9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZAk-9iMX1uhtNleSEbMA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: V-yAbidxTbCUyIOoyZhTzeix8rDhyPti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250125
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99914-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9073A329CED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 06:30:37PM +0530, Viken Dadhaniya wrote:
> Fix GIC_SPI interrupt numbers for QUPv3 SE6 nodes on Lemans SoC.
> Using incorrect interrupt lines can prevent IRQs from triggering
> and break I2C, SPI, and UART operation.
> 
> Fixes: 34a407316b7d3 ("arm64: dts: qcom: sa8775p: Populate additional UART DT nodes")
> Fixes: 1b2d7ad5ac14d ("arm64: dts: qcom: sa8775p: add missing spi nodes")
> Fixes: ee2f5f906d69d ("arm64: dts: qcom: sa8775p: add missing i2c nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

