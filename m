Return-Path: <linux-arm-msm+bounces-108855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMOaIsPjDWpN4gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:39:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1A0592300
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C71F93069627
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB87C3D75D3;
	Wed, 20 May 2026 16:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8a9Qk1U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kQxc8gSF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564613DC857
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294553; cv=none; b=GmtSAV+I9rb5+GS1e2eaX1GmZJXCIJd6g3G6SowkAlp8mCciCqd5sW8pNcEhVgCraYyWWM5IfffBl3YY8ReWuUKuc5uHAqB0M0YLRNvfjFv3HOYMbiFGmIoaIVymInYyc2dr7R64VzYrWVCsutNtId8xZFSdj9CXEqwKigHDbIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294553; c=relaxed/simple;
	bh=guKwrZEYvB5h2JRruAj/qRVD+1cfikuiDLMfNbEldiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ScTRnkn5QKLIVMNfYslxPiKV1nPh/mHeJEm+/X1FIVmjgaBPJsRk+XXE7zkq5mKu3vJfIaBpWmEakhuyknvfD+DTqAl+hPUkMVF923poKqJdpuvyxyGDQ1/xgRPfypixpSRTc8Ne4lFpZ4HwceltNiotJ+A8F0sOS79vHrJUtXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8a9Qk1U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kQxc8gSF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDuSj73680282
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bUSeSLkufQVYtp8EUHyZA6H3
	W15KD1f1Veui0HYJlds=; b=X8a9Qk1UgXPMXI+4yNaim+sV9mWAN1MGIsGOW0gB
	nOqUYN+coVA1beMx/Oz5randUXeF5OIE/Q1dYTLaCCJnvbry7RvJGJj1gbTo4pMQ
	s+VhLdXx/Y2fEmJ0L7MX2sW/XpMeG/slgziMF7n/U0u9WfTAWuoLRFw2kHdtl/3G
	A29KHT8+bu4NMtcE01+4g+6ep4GgpiIgtjUMe+9K4FSVyZk3U2On6ncoxwmWWF1z
	GTO2hMsYfpnf9rfR5GoPq2I9GSj35rSCx0Ozm22I7rVAhnanCUazY5MTrHJri0Da
	T/B0CRC+1Cel4zDBQ2wACLZuSQAFmsuulX7m2uMHB8ZNqg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j0ppu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:29:11 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-575427e5360so5102190e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779294551; x=1779899351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bUSeSLkufQVYtp8EUHyZA6H3W15KD1f1Veui0HYJlds=;
        b=kQxc8gSFV2tF2bDFx4y8jYF40smenf87cVbz8cXRDDgptanC2ymozkk40JQZkQP5g+
         18I+yNHvPyspEJ0J0fCnZfKpmyncfAI+kkfCziB+c0dd8+i/oD5cwyvr+7NOPAeul94S
         ZOcUUa+XfLzBJYU9PQEeFkGFbxByOiWfl6EJM0CvhnPnVI2id179ti3x0ePRsW1CIv/7
         tMIB9au1pRdl7sV+4gcC4Km9QqZzjZNnH6N2f1dnydP2B6XKkFSmQV6MErB8annbiAk3
         4Ae0t6LYbRJx3NgjIilmbIxPyFDQ66JGDVi555fbAjUuX2PJvKeLiMhI2h1T58n886YO
         HjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294551; x=1779899351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUSeSLkufQVYtp8EUHyZA6H3W15KD1f1Veui0HYJlds=;
        b=ShJyaL+fAETT8dxcuIi7/noQEbdFFWnhpMnv4JDUZStj10flzvw3sH6o+GmuRXEV11
         gAYAMeMsqix248o2c2IEZNHv43Hp62wB2setlarK1p+dLM8usZhnYeB/ORFeIOItjdnM
         NlNWfZIuoKiaYLBDC8GPAlGCxtkGl+RRv+NbO1jyg85sHgzZGvFUhRk7A7Eli5MG2soK
         1oFTF0NFgT8y1MmIaCkcczVsBfWP54LTRVR0GXt/33r5FNBtJPChxBsn8rtHBP55CePJ
         vVfJoky5Wivp3x5dhf84k9L8sBXOgFlgzUQC2Ov6HI7OTGFD6LUbex6VvaaDH5nQquny
         o8rA==
X-Forwarded-Encrypted: i=1; AFNElJ+jzcOwblLgE0mvffzUWDU5WCzrR/OX+8bYKj1IDqVPs0kO9j2zK7kxBluJsXMGtpAflf9UeFyiivUJ5Uts@vger.kernel.org
X-Gm-Message-State: AOJu0YxOiqsQPeyy2/pT//0oYcueE654s3mMBUyPB7wUusequGLAjJD5
	j85h7Tq2sMw6scg+sV1KDGgKY18k9tdx/Wyix4OsahCzmVPip7FQBkBpnA7KsWE4+nmQX1k/0QI
	bUZeNF+67CGIzyD3mWvUEHTLZz31qtyNt2bxe8bA9TU+sf6qSRYtWVuodGtRf7DU7NX6j
X-Gm-Gg: Acq92OFV3YhFhRlhDWH5EbZ7y7PYxfwSV5WXdCCmwpCkouuNjccXGkwQ71LcO4V6qCH
	K9roZ6B+Erudn0HMIpVpgy/n3zw9owAbrlcbcHnKDG4X1YiFVutGlL6HCzc7FmwIkaTCl1OyYuc
	RCEQm3sJBr3+2SfD+G/5PZWc9Y7DPz0DVSdNED3sK2rpzH4BebUuT7Rdv4qMlgK3Y9ChRslh3im
	5QRZ5K3VgO00rPRwAcWhkTdkaJ6C7m+zJvxQ71SLZFIi1IYaD8vmZ6WgVHeggTaz2QAFWI9GL1F
	+nSfGaOsvNEx9GZ6fjcuNMpBELXprmL9dfrsud0FAu3YQTPhzt3TCCGZ7K+lxABNn2S33vtJLKP
	l76/tv8fzuacnUrAptCCMtgN3CaV9tVjEYkVAG8WwfEaIzZ7j8Fe2hQ7rxj4cZX/k7T7oiR6V24
	O6Ch7dgjM1ztGx6ptx4MYwm5FrVRbOfLAvyb0=
X-Received: by 2002:a05:6122:d15:b0:575:24a9:78da with SMTP id 71dfb90a1353d-5760c013206mr14705277e0c.11.1779294550520;
        Wed, 20 May 2026 09:29:10 -0700 (PDT)
X-Received: by 2002:a05:6122:d15:b0:575:24a9:78da with SMTP id 71dfb90a1353d-5760c013206mr14705226e0c.11.1779294550062;
        Wed, 20 May 2026 09:29:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91a6a1906sm5061603e87.79.2026.05.20.09.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:29:09 -0700 (PDT)
Date: Wed, 20 May 2026 19:29:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: Add support for Display Clock Controller
 on Shikra
Message-ID: <dv5rw3gkmy7evlv3bm5ryewy6ppojxgcklamqmc3x567isomtx@3oonu5gtzwq6>
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
 <n4wgnno2td3xmdsgwadvdtvr4ncitzio3ufufg5bp7wnga4ouw@mj76764e3uus>
 <dt5j7khzvgoj5qdrnfoi6ssye23jve5gjta5qx2ubuvufjzr2w@puacv5jgosmb>
 <1cf064d0-14b9-489f-964f-614aeed4fcbd@oss.qualcomm.com>
 <qg2n6pwjcoz7262eylept4mec2l74h2owfbhjykfxap6qwgzuq@oawiwgok4hhi>
 <1c0bb8ff-eaca-4779-9b2f-4d564abd8670@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c0bb8ff-eaca-4779-9b2f-4d564abd8670@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0de157 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=2jIkRjB_xXtrPJ-GUZgA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: aVjySC7B9OKDKnqji95-5SzbR5xUUv9Q
X-Proofpoint-ORIG-GUID: aVjySC7B9OKDKnqji95-5SzbR5xUUv9Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE2MCBTYWx0ZWRfX8WM0heFjeGOo
 kMlolLm0KOMldzfO6NqyDUBQA6Pfs6+rpELIY74cDkew7roXci1Ht2QSzMvbenCyJXlyiBCWbMi
 E+eum3SKJwQypa+k6uc+Tv2ELHY3vlDGhrmKqmV5oPJLL1v0/BeXzFcGColAV9yHqr7Vj5jmGJQ
 T69pIXyGkRfGE4OwZfCwmIEeOU+tCtpe2n7B4PtN5fvY/4E2ZA2C0rpLoQofkSsme5wI0gGlstO
 Xd7HmwlsrGPb9zy/FFiF8QUVndKogJwCzsSCAx33NBnl/xN1dEm3R5ioLWt3HI3vllmokma6hMW
 CjeRJ9Ig8goySe6n0uzZwDbHfmb00UdrNyqpro84vVAZBq8gW86y3agQikSI+nowSmubafgw+V+
 TFCaxcGy3Z5gkpcYhmPAi2zDPKhuFOZLayxai7r5DZD0V+XExZGM26ZJpryoKJc3615boLeUT4M
 paFFs3OnXLPSWtqJgYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200160
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108855-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E1A0592300
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 09:34:09AM +0530, Imran Shaik wrote:
> 
> 
> On 13-05-2026 08:38 pm, Dmitry Baryshkov wrote:
> > On Wed, May 13, 2026 at 04:51:03PM +0200, Konrad Dybcio wrote:
> > > On 5/13/26 4:06 PM, Dmitry Baryshkov wrote:
> > > > On Wed, May 13, 2026 at 05:01:16PM +0300, Dmitry Baryshkov wrote:
> > > > > On Wed, May 13, 2026 at 07:10:38PM +0530, Imran Shaik wrote:
> > > > > > Add a driver for the Display clock controller on Qualcomm Shikra SoC.
> > > > > > 
> > > > > > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > > > > > ---
> > > > > >   drivers/clk/qcom/Kconfig         |  10 +
> > > > > >   drivers/clk/qcom/Makefile        |   1 +
> > > > > >   drivers/clk/qcom/dispcc-shikra.c | 565 +++++++++++++++++++++++++++++++++++++++
> > > > > >   3 files changed, 576 insertions(+)
> > > > > > 
> > > > > 
> > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > 
> > > > After comparing the files...
> > > > 
> > > > Can we use dispcc-qcm2290.c instead? It uses clock-names instead of
> > > > clock-indices, but I think it should be fine to use clock-names as a
> > > > one-off.
> > > 
> > > Or we can convert it to use indices, since those are stable for agatti
> > > too - the names would remain in the binding, just unused by the driver
> > 
> > Either is fine for me.
> > 
> 
> Hi,
> 
> In Agatti, apart from the clock-names difference, I see that the AHB/XO
> clocks are not handled as always-on via the probe and instead rely on pm_clk

There is no pm_clk handling in Agatti driver.

> style handling, whereas Shikra follows the newer pattern by marking required
> CBCRs as critical during probe. I think that attempting to modify this
> approach into Agatti may introduce unnecessary complexity.

Well, you can start by explaining what caused the difference and the
result of those differences.

> 
> And the Agatti DISPCC doesn't have the DT_DSI1 bindings exposed, and
> updating this might break the ABI with respect to bindings, and DT.

You can add Shikra-specific bindings. See how it's handled for other
dispcc drivers.

> Given these and considering that Agatti is already stable, keeping the
> Shikra as separate GPUCC/DISPCC drivers is better to avoid the risk of
> regressions and complexity.

I think you've provided arguments for merging two drivers. It would
allow us to modernize Agatti driver and also to make sure that both
platforms use the well-tested code pattern.

-- 
With best wishes
Dmitry

