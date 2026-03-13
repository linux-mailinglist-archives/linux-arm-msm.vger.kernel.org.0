Return-Path: <linux-arm-msm+bounces-97356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I4rMITIs2kqawAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:19:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDF927F7C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD0F030DB17B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6BB37701C;
	Fri, 13 Mar 2026 08:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1TGl/q+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2U65T61"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B6C375F65
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773389674; cv=none; b=UNFLa/Tieq9TUgSCVPDII1uRebAtHMc+WLiGw1aZ3icufDgkWTj03VdWNluXk+VyqlMqwFhRmjR8zOFOhvYnzYQbbJD2+VSc+Yxsi6ZkGX6kHZ1eUTw7OSrJkoopHjJY/2IXPHmvuXFIEKM/RTbNzsTvTM4FLaexgMsNbEEIm1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773389674; c=relaxed/simple;
	bh=nCazltDCI4lAoTONhY3cmV1ujaRQ9tRghJvYtDwZgFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9FTZ63UAjX1/Qnc2Yqg1KQ38Xa2SN1qg8TR4nlgGzOprVXtAPOjVJIbJTO9Rmy+NJ4xxwcBID/+D75UtJ4irtgOin7FDm4J0/SMZw4VZ7DdXAqT/E+L7Tcfm1id9N+89d70EdRZFLaZh4XBoHjuAqTB/bS4XyeVuwYvJxw0VcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1TGl/q+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2U65T61; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5taCD1176345
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q2g8QXZ51t9IcKRcfUMPQORt
	FVNOSJeXcJwfEtCFtJQ=; b=d1TGl/q+egCGhua/NRQK6T6uHVPwFGAb9L/bbbXc
	TtE12oqiVDzFqARt1qAxrypr8rXfXVCF54kcaBnrqnVrJ1b+LkFi3QJM0sSo+yXe
	ErApve58biiwESDE4MIAczsZ7Jjm1VXPWzQ1ki1dLu8cRhq575eGV1pbqQHRCPJ9
	VvrS9uOk/uGfEunmGfi1n14w5kYzUXPBru0J7LSCy4g7uVrsLZQ8WHhaAqetg2B0
	NsJJVCl0BI3iSGVA4IUGs7FW9KMsibU3b5qT0nHVgR6o52uLk8+ZLQVcI5BRU1KR
	SXQDaU21p6BNJX8r4cdgE2UqgYLIi2JhLxslrbUoQZoaIg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvqcm07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:14:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899f474fae1so258253276d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 01:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773389668; x=1773994468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q2g8QXZ51t9IcKRcfUMPQORtFVNOSJeXcJwfEtCFtJQ=;
        b=C2U65T61CN7ZR54VOCaLfBKOuKIqmV7UiUwKWAoiQKrNANN5C+Ih7im8svNSHyGpx2
         r/n1eiVc+yxKrPjLuDSln/UCK0XEAboYOPh+H1/wwJd4sESMpjiFJqFGLkcC53nQNV/d
         bLsU0U2KHLFxkfuqbdJXuMTpxrA10YP8eyjaLR/CklZt+nFZqQn/AOgEELxKXgKR0YoX
         O4gq0iSO+6JDdVIDmaS3ktLkfP73GrRMe8yhhhF8R/qsPQZvlqGH5gA4ANc7zMaa/39Z
         7IGeGOWmAPtHHvyMCRsNgpIZmTHRP3YbE5rJoBmyjqG+LQm4hFS1SpOcgatZMHCxGoci
         c1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773389668; x=1773994468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2g8QXZ51t9IcKRcfUMPQORtFVNOSJeXcJwfEtCFtJQ=;
        b=a8baJ0R6ZmaqfitdtkY5JKFd/8xJ7fGRil3Ww4aP33JFgq7qbq6kHOKqSRk4Os8RpY
         b6FAI1BTI6GLDuLTKrblhfxWDHInxFvTQ7mQL3FqhEZk5+CneYfRuEvmvNgIsqBDRWck
         fOuD0jbvaHpJIO37mEoh6BmH6VQYedElZo92fCwQ7FwYFncl7anyE6hN975Io2OC86Qv
         6zVc9vy4G84KRf54RAD3PgblaYRDJHYVuaOYXMvTArHLME+cqb/CEWZ4zgSfGW8zYWhp
         0ILCRYI4G2yg2fOjpPGVvU6E4KnYAmjhlwOqpE3s+kHxivE/mRJsRV5awQVJYmPOi6j2
         yNHw==
X-Forwarded-Encrypted: i=1; AJvYcCUTLM77eIW9EVOjoPdlR4hwX83dL6RXXVP5VgafX4zkE9Y86ei+RtM9UXg0RpHRaL8JfEHoQhihMuFRhfZ4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx14SKfA7sXrDgsYz3jRT+I+mScCTp+GWby3o/tythHfh0dQubH
	5oAXN1/jJJYauC8iKGhvH6W1QYv6JwVKJ9blwNgHxoeKwKWFFbTD1ZTyOxs7ItBhoHB0dwCrimx
	fdGu8A5K5RsM75g/1CNhyBfWMq0Y8G7FTi/cSoTRboBr3sdtpDKdHMlh1sUD1jyn2UZaa
X-Gm-Gg: ATEYQzxahmgTVk7oTSFoWalnL8JUi8HlX38HVr4PuuQhkmd7pd22P+eXLNaFBpZWO+i
	8eZbLmSYWyY8yQS3knWNtP+xBAN15kocVXoIrT7jtVWrGtUWOLggdcURo3Y1riKD+3JBkMxlZv2
	3ZJEOgL1TC8WcyjnFfR3KXSo//yk8G/B/nlhRiN2pKWMMLNfMf26cQr9HyClf1qkE6l34TWjfUU
	QrXf0BgLKXMVEHevDSXPvpurcWOMaN9QUBP4XgJLhpyXzOkmrxIjjbhZLHI7/NyTk/UgrHd4fJL
	bE5JfeVDix/X9pWUyaH7y3x9PVdfDpzbZoW5Wj7YZ0M9ijcca1Go5CPLIrx7Wbtot1orR52kJd7
	kgqMlukEbv2quxWNrP1ZQJSOSzqeAstD50PXVztJE4Ir9OCOwCBnExKmuK9BiYzfldgK8veXymN
	1Fci1kPv9YJh3yMIf3lLaYD7qlkgej+EZxJRQ=
X-Received: by 2002:a05:620a:701a:b0:8cd:85e1:e214 with SMTP id af79cd13be357-8cdaa88cfeemr775786685a.37.1773389668248;
        Fri, 13 Mar 2026 01:14:28 -0700 (PDT)
X-Received: by 2002:a05:620a:701a:b0:8cd:85e1:e214 with SMTP id af79cd13be357-8cdaa88cfeemr775784585a.37.1773389667811;
        Fri, 13 Mar 2026 01:14:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15636a96bsm1409223e87.79.2026.03.13.01.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 01:14:26 -0700 (PDT)
Date: Fri, 13 Mar 2026 10:14:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4 1/6] media: dt-bindings: Document SC8280XP/SM8350 Iris
Message-ID: <ksk3hjyauhbzvytvch2xip7kusuicnatbw4xlmg7wtfiyatzpv@y5q7xjvl7esf>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
 <20260312-iris-sc8280xp-v4-1-a047ef1e3c7d@oss.qualcomm.com>
 <20260313-resourceful-saluki-from-sirius-f4e1be@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-resourceful-saluki-from-sirius-f4e1be@quoll>
X-Proofpoint-ORIG-GUID: H2iKGNdumbrdtkrZvECx83t7LhkmsBzi
X-Proofpoint-GUID: H2iKGNdumbrdtkrZvECx83t7LhkmsBzi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2MyBTYWx0ZWRfXy7VHaFIfj2dh
 2aZQSJNMlGrZ7dWqgnvzTRo3EW8uDVnZzuVJhH4jziqxyM8I00Xx45HjzhqUlv5JHos+I/Qwnvi
 sJO29JnmqJt4LmWlnWjuvjYG4H4Ny5g3PUJGLZhEYMwvyaUa557mtyaIKia6ljxBpsk97dMXx+6
 V1AZU50mdoRTX5/7mBahyvyYndXAUNuHyjm2bmMRbl4cbDjKO8cQvM820lY8RHNt1qgBY8fySt6
 R8aol2ImOPkst+LyLlMdEwFjO2ZiD5K2pHYwNpO1MNmSRVzYpqwNjCvvL4yBG2+iyGwLp6zuvU9
 qLi0MG1MPF2BEGnVWdxn1HXASy7Bokn/IC78Np0wMrIMFoytbB2HM2Okk7aam8alkUm6xblaLtk
 +BtwLbDZs4jwPPy6xwz1xq6mLjt/sUV0SskVyMugHeW0jP1GX1cH1j13zC1BcEnb0acn8cGBB0w
 oN78Ga1eN+2hN3WqhAw==
X-Authority-Analysis: v=2.4 cv=ccHfb3DM c=1 sm=1 tr=0 ts=69b3c765 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=yUbFqew-2eR16Ho47hQA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130063
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97356-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3DDF927F7C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 08:55:00AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Mar 12, 2026 at 05:14:22PM +0200, Dmitry Baryshkov wrote:
> > The Iris block on SM8350 and SC8280XP is compatible with the Iris
> > (Venus) on SM8250. Document those two IP cores, using qcom,sm8250-venus
> > as a fallback compatible.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> > index 43a10d9f664e..3700f8fe91cc 100644
> > --- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> > +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> > @@ -10,7 +10,7 @@ maintainers:
> >    - Stanimir Varbanov <stanimir.varbanov@linaro.org>
> >  
> >  description: |
> > -  The Venus IP is a video encode and decode accelerator present
> > +  The Iris2 IP is a video encode and decode accelerator present
> 
> Why Venus name disappears? And why now this is Iris2, not Iris? It's the
> first time such name is used. Just call it Venus/Iris if the new devices
> renamed the block.

SM8150, SC8180X had Iris 1.xx. SM8250 and SC7280 have Iris 2.xx. But
when the bindings were written, it seems, it wasn't obvious (or
important enough). I will change this to Venus / Iris 2.xx

-- 
With best wishes
Dmitry

