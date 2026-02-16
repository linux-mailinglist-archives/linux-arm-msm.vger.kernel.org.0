Return-Path: <linux-arm-msm+bounces-92963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJsYAkkjk2kX1wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:01:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6C61445C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB5EB3017BEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A349630EF77;
	Mon, 16 Feb 2026 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzRB+jN/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MhgRI902"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440E930FC23
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 13:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771250253; cv=none; b=XCDQW/fNyJ2QKqDEcgww5pXF/wg6D7VdSzrlGjlCv6oJ/kOWGJKOR3nE2s/GUsKmqV+Si8BJcnr4Gik51ACk2XPkEFsL9+GVNXKTO4VZaNxPg4k7dZNM4as9NKgz5e7MN1aXDVFNpkpz9f0KSOqjtUlURWPEj34sSVcdLMyCOQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771250253; c=relaxed/simple;
	bh=egi0uDkw6MG+glwNePYnB+SNvuHEajDza2jPy+y0ccg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q0eVTC9iPEnmfOXnOWE7MO1SokWFEEsLN45rOxaqApGLPmAiCd3xfo4qrz/uOmg4u5X6GADRtcS19RrF0gRdPb3HfIlHqfuVdjOXxcbEG49XuuweyWS5XH1+QBEveKU/0yptwsyhlC4RTGT1KdEpBZeX6RFfcY6xeZyGqrIefCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzRB+jN/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MhgRI902; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GBG2bO2498419
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 13:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cCkrZtY6hQvMdL46XWacBkUg
	M+AID+bF+UdrFpXbxMg=; b=NzRB+jN/Znh5sz4kiyG83yneyobsm9dqWFCpRT7j
	5/F88FofvlgxTQd42JwL9VK3dt2lNUB6kl6sB9Z1VQzpRNlsB/+PHyS6jJWbKig/
	cAWCVVF1i3WBPorLYce03CUhQd/jjRwuA6OF41NgXQmesi1j3vA+GbPuQwQ7HmMP
	CORrVc9BPV3/XVWrCAta4cbuR1FJREbWYS6snE/w92nKX6TV2274k08/+RoL21qu
	x2DYlFImxIdw/5uWjveZkdrOUo5ms+kDNQ8xUG9BVOqHoWfPgMYSyYtVDwLtPs22
	zpR51Ax38jJS9CA+OfyRFWY5RWd4qfXQQBR+wKvjFB2jIg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cagcf4rqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 13:57:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71655aa11so2556101585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 05:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771250249; x=1771855049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cCkrZtY6hQvMdL46XWacBkUgM+AID+bF+UdrFpXbxMg=;
        b=MhgRI902lNG3zb1LmPwAXABXFa1EBsmJ21SnoUScdiEiaDVgGrXeu9AZjddF+qtbPu
         mukEuZVqh4Xo4wuSa1r5XalmAQUve6PscvddhuZxLR7Nhbr3Kw3oOqgAQ4EDUP9KU0Hz
         +wtzQcHfahYVBXGa0994aJpBZnc7y3GavppGANOV57wbvN3rX/Bcrkf2HmzD7h7SdxOT
         nVVATSTSn1A57aD/0EEaN7lS0TwLUYf9OeaSNKgeMVbASZd0IzZNmARwXsaa0ZlVG7Bo
         ezQz1f7jIvPh7FFWfmv+HqAvnKOyagTYmsxltWcKolxRjGxMGRpHWCfc+Oc2EtFQVjsV
         QLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771250249; x=1771855049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCkrZtY6hQvMdL46XWacBkUgM+AID+bF+UdrFpXbxMg=;
        b=WS96jQEyo+YwP7qUvoY6A2uwxia8piP92t/fgjNrCHi7Kgdlc6R8sAuJr+l+iRPlfk
         WEJumdpb678Q6QJyEL8CR2Q594/kuWP6d+RbivIjiyhRs65zxCu//xSjjpIVoDixEgD4
         jw2ZXz0N/T4iOvH3gvHH0nAAlolaMKnSxEhM+ApGRxNoXmJxSssqIWlkRzo2YUdiDPbk
         q+iQeueSfhM8aO6WfP3Ocjbb1O0yAFhyDgJnCMleNbJoAsftGCNnNXjRH1/YP7Iv4LnU
         essJPm50Qw/Z+6/7HBtKIq6W6pQbfe5tTiEoD0EmSwRRcysU3y7jm3P8knRid3nAO5zo
         O1Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUrUXz9gzwWxdILtSTdaN5oce9yxI12IBt8mfjzOy5j/cXGiRVnHR+7HRGSeIr/vqUdowikuUiG5KURC4Hz@vger.kernel.org
X-Gm-Message-State: AOJu0YzWYqvl1Ls8joU0NtfTFjgKbQ9r38q+Or3wjPPr5z7FJGJt9kYH
	Nmve3pYUjGlzJ2YvmvEBnkLbduXmYFuZKI2+YbAHIR0PRPRQi/uDYxVU8NYubjBKhWymdzoVHM7
	hD2GwgPE5JrlKoiJ7DaR6tEsaPUZ+QzyCJ+pccFUmwZqNn3qdvFLHanh4glv3qnc0xAn7
X-Gm-Gg: AZuq6aLiYG4Me+FG540J6e5z2nHz99gkfJk8+U8iC1F2OYtMlBNL5S3iZxOoUGVs+Ne
	Pt0FDvktIurv7pJ+cE3t7MlA5fhp6AyDaQbu9UTdTbCG3IU8PVhHJVA/E/Cwcm7yMcRwSLcwqDC
	4ODm9+84dzmEGGevy470/OngwpeGp4SVLbC8NFrScuw15WatSGJiDka6D9Upy5jae8+rJ02588Z
	RD2sgVtfEsTPIS3lrWxY2C4uuEcGJaAuOGx0v0GvRFR73AdfDdCrNS1Uh1SLhRUoKqQDRJ6ccXX
	fjv/Kt5FpL8QlnxD5HyawQv3BRBBp3YkIwTK6bKsMhpALONsjNezVPXHgTCzGHm7DP/4eX0JEWR
	HcFbHsyvD/uhB4sU43FIvlCHgGlIJQBHCEDPEiWXbefRIaYt5xipCHTDG5UShEWITICzSUSNvVW
	QnvEG5L1OXbFU80XwxLXSSXJYYvB/8Cwcx2So=
X-Received: by 2002:a05:620a:4486:b0:8c6:abc5:f169 with SMTP id af79cd13be357-8cb42479b59mr1248159685a.73.1771250249176;
        Mon, 16 Feb 2026 05:57:29 -0800 (PST)
X-Received: by 2002:a05:620a:4486:b0:8c6:abc5:f169 with SMTP id af79cd13be357-8cb42479b59mr1248155585a.73.1771250248687;
        Mon, 16 Feb 2026 05:57:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5a4f8dsm3257023e87.49.2026.02.16.05.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:57:28 -0800 (PST)
Date: Mon, 16 Feb 2026 15:57:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Richard Acayan <mailingradian@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/10] ASoC: dt-bindings: qcom,sm8250: add compatible for
 sdm660-internal
Message-ID: <nt7rqp577vxb7qoqxbaqldv4n2erfg6gpkycfqi7hqkdwirncb@squrvhxi2tlz>
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-2-mailingradian@gmail.com>
 <yxrhmblavwkuhfrfgskujs7tz7cykojnqnl2mfrf365lhdem35@bgqwiaft67b3>
 <20260211-skilled-transparent-moth-fac10f@quoll>
 <f1b67c1e-cfc1-4d23-a24e-4dd342edd2e9@mainlining.org>
 <f27ec5bb-1562-4bcc-9178-4ff4d4fe00d8@oss.qualcomm.com>
 <aY_uQZxuwt8rDf6n@rdacayan>
 <ddb41df1-2d60-481b-999e-cc480a6900f3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddb41df1-2d60-481b-999e-cc480a6900f3@oss.qualcomm.com>
X-Proofpoint-GUID: diI0q3v7LGuyqKNWxqNbA7KzDQAQmXZP
X-Proofpoint-ORIG-GUID: diI0q3v7LGuyqKNWxqNbA7KzDQAQmXZP
X-Authority-Analysis: v=2.4 cv=Sc76t/Ru c=1 sm=1 tr=0 ts=69932249 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=OuZLqq7tAAAA:8
 a=0c9jgaLhmclDbT0NVeYA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDExOSBTYWx0ZWRfX6FF8COJec+es
 wM8IqJhqyvCPARg1Lugj4gPbaH963O5B9+0ngue6U3DEx5gmLaR6awBfs/PNzY4pDUETVnHmBp2
 ar3Z27fsOi7+0thWFLXeLlMrFK/vWKQuST3DeWP5KIq0bOQ/dkWPMT38nSWksY0FY4JHoxrLhfT
 mRrmGP1TB7JIH1Usb6Guq52cTQEjy6iyAhVCjpEN1KCQxDmfwjbKrmXQLnJKmR1v4UuF0RgNiJq
 uPDc3PdvqkSEt1VahCPm+FlpwO2fKPbKVP7b07oV1i5QdXk2wsG9bPtN6/dWotlIQGd7VUe0X86
 n1W0Q7FTiDlQHnrio+xT4UNKlnj63m+Hk4v+tUZ2haB38NscZTkdo46NvbqcpN/GGzcrDeFsnEA
 0lIJzfx8kFhuKPV0eeSOxzFEhBBl91tqZ7FmvIJJjjNHPyCvGAkud4P8s1JO4CxDskTBqE/rsqO
 11t62aWkxmCzp+F0scA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160119
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92963-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[mainlining.org:query timed out];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,mainlining.org,kernel.org,perex.cz,suse.com,linuxfoundation.org,quicinc.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF6C61445C8
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 11:53:49AM +0100, Konrad Dybcio wrote:
> On 2/14/26 4:38 AM, Richard Acayan wrote:
> > On Thu, Feb 12, 2026 at 10:34:27AM +0100, Konrad Dybcio wrote:
> >> On 2/11/26 10:55 PM, Nickolay Goppen wrote:
> >>>
> >>> 11.02.2026 09:51, Krzysztof Kozlowski wrote:
> >>>> On Wed, Feb 11, 2026 at 04:11:24AM +0200, Dmitry Baryshkov wrote:
> >>>>> On Tue, Feb 10, 2026 at 09:02:53PM -0500, Richard Acayan wrote:
> >>>>>> From: Nickolay Goppen <setotau@mainlining.org>
> >>>>>>
> >>>>>> Add compatibles for sdm660-internal based soundcards.
> >>>>> Why is it called "internal"?
> >>>> Yeah... I am pretty sure there is no such sound card. You cannot have
> >>>> sound card internal to the soc, because you need the external components
> >>>> like codecs.
> >>>
> >>> It comes mainly from downstream driver name [1].
> >>>
> >>> Downstream also mentions it as int_codec [2].
> >>>
> >>> There's also an sdm660-external sndcard [3].
> >>
> >> It seems like "external" means "coupled with WCD934x+WSA881x" and "internal"
> >> means "coupled with (digital cdc on SoC and analog on PMIC)-over-intI2S plus
> >> optionally WSA881x".
> > 
> > Interesting you left out WCD9335 (codename tasha), is it never used in
> > production on SDM660?
> 
> I don't know.

msm-4.4 lists WCD8335 in sdm660-audio.dtsi. I'd assume that's the
standard codec. On the development kits side, IFC6560 uses PM660L, while
Open-Q 660 uSOM uses WCD9335.

> 
> I think both were used with MSM8998, so I wouldn't rule that out being the
> case for 660 too
> 
> Konrad

-- 
With best wishes
Dmitry

