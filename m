Return-Path: <linux-arm-msm+bounces-107254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HnNLtpWBGq6HAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:47:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 574E05319C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C9BA30065FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 10:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4D63EFD0C;
	Wed, 13 May 2026 10:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JH6A64rL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cj8ZNT5+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3880372042
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669270; cv=none; b=ZhGnuUfdekgZQEzPL4cKWjz5M1ug0iuLI5ovSGvY6jSdQQ2vTMIH8EdDbXAzoI5koud4RZ6e0npZtmmLd8Ohwgxaz76eVt5SnMv2ThyQXiEqlucLYFZVyn0K4SmbgIB7MkOI6yskcEgEFOSG6Tax5M7KFrAsWarMUy6G1cyhUBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669270; c=relaxed/simple;
	bh=/N7wD6EDn2QnmU4iofDKub/Er/WkLOeAxZr0xil5aXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmaavRP6s834mIUaTvRJZ9465qja55POO3V1CoI/25tPlOm6zEi0umMpka2xdTx22okWy+LeITOnsfN2SViP7eGm/kc8L/cMTv4MSlxxL1sLBH5Ome2Knu2+d+eXZAexHRsdtT8e6+1uXbW4thjjc4oc69KC1CFUW6UrCPOpZb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JH6A64rL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cj8ZNT5+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9oeNv2338837
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m4YRq/BGboedIrLtHZCID+NC
	xpsQ7QlOG035C9bl6jU=; b=JH6A64rLXNLzdwIJ9P+bK3a9z0JurehEF0gRaxXW
	XFueZuKyg/hso2X9FlGtaNid1kiVOqQ1OHEmgeIDzUoMiE88YunnpGae9D9Rqbot
	SqkoztxSyPsDjouT9xpSdG2cRSmQzih9OgiXwNJLzfq6qz9IuBmmSi9h5HdW7TBe
	X98339Ja7hPwa7QtFi/FfcqVOx+iDaGYLTcJr+lWwS0okGSHve23vp6+ZeIXugT+
	VKedoLs8RH7TBtcTUjtQfgzzvpseEULy+jOXIAZ1IalqTWt2wGob9wg9q66rGvrb
	3GNRWmO0P56nj+EtHY0Im6ErW8PN8S3CcYVJaUlpIrdmYw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxb1sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:47:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso158950121cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 03:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778669267; x=1779274067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m4YRq/BGboedIrLtHZCID+NCxpsQ7QlOG035C9bl6jU=;
        b=Cj8ZNT5+SbNqGvQ2pXqPFyhYLHngPnSjDyLe3qxqVdM/CvEOcAdrgiY3XV8nT28VBm
         tghFL1vwEowgMyNgHgkEPOCwsQau+1mPOxFe8DFEwSD7EoVYVXMFyg+zwWtHr/UQjgoU
         OERZN/MNLpFZ7PuOO6A9cWI7K6WGfp24dJcX/p1NVLkdud5YUh+9e48LsXPy6kFPy24K
         U9Y2eODMovoyBqJKtSg1veYXYvxqsrYZBGWVGETosH17gGLcosJPQtKJ7oPQBmVjN9Yh
         aoTrMhTzwtVAjcGDsMw3on65u3arxJQGYiLRD9G0ZLNj27KVy8N0Onjn9oNCchFPN5g4
         Sndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669267; x=1779274067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m4YRq/BGboedIrLtHZCID+NCxpsQ7QlOG035C9bl6jU=;
        b=Em4GdzA+8Eh+UQ13ZyD3ZXEUMWHBbS1+PYDemRzOrw9hVCDrI0H6O09vcrOjy9VWIu
         XBcXfCiVWDF0ASgL3i1JPcqz8HdmppGAW04Ww1TyH1xcfXdLx5sEGua7q8mSDirAznfH
         cKhpyn2iuejbYHxkcn4DVCBqwA0bmOT7vwXbn2FddlcC42IqStpw0UR1/ipkb4dfTj4b
         xneqtBJCpJAAHIOKq1sqQhdHuptISK27yRFiDBjH2flQORFzaHEwBrrYM54vdSpFU4R6
         YJh/ZHWkQnjt+jYa5dDNiQpiY4s1651ByEdByNhg0EvpIrbaAt4pqSntCI3boYlUQnl6
         j2IA==
X-Forwarded-Encrypted: i=1; AFNElJ8A6s0tomKsn13l+NunyWTTH25AXCpCC4j068s/m10EvsXrBEVhAbAZF4qjPZIKhHG9G3mR/A+3/gLub9wp@vger.kernel.org
X-Gm-Message-State: AOJu0YyMtxUPGnOfXq9Iq7xr0ki+9NesvZVT8Au3GVO4vuTqz/CT14hN
	16cXQFuaQYt0Eo0RU5h1/Nho8NmsfRVk4ufjICE0XlrB1QWjBIA56fQSuZkil2E5huiokP8g/9b
	3Wv9nV4ms8gm315YuyJoDPp7QW7jP4kZ3Ogdhmx9OuKD1eIpFt/Zd7zlqALGK0I4vPp6J
X-Gm-Gg: Acq92OEsQa/nCZmhQrkQlzTmiYOJf4VnV7DUUoCF5FiLQhppgFNY3Iyxx4xFxLu3abD
	XQ3HFW9iPjbVJZap316FkUKZBH+vm8YvCLTwGSUwnyOGa0K6eWbheLUeU9tomBT5hjxY0quxHZF
	cyVHkz1hJ9Npg9rWzguSIzAgZXD2WwLIetlxx5IpDhnb+rEYEnsjPab5H1+rTJruZoMkfyqOm1p
	/+K8Zp4xpC3gCcAkqmHL0vA2D1H/+OBnhyfzq1kkKwgsGPiIBONDXdnC5JJriwTkgOzwI6+saJM
	qLGZjqXecaHtKu1at3/HFAf92vC1lc8PQ9Zwv33fQhyoWD1ZH1dUNMuXCOrQQl9Xoyp+SE9LbjE
	MF/uBHogk6T4W/S1pdDQ5jDBDIR1X/juAsKZY82D3y6mKJvhG/YAC1F2BupR5OZvCsBsP7AeAgv
	ltU1aKZN1qUNoPyldtIDra3sMdXZ0iz0Bb6F8=
X-Received: by 2002:a05:622a:1a94:b0:50e:5a87:6c0c with SMTP id d75a77b69052e-5162fea2b7dmr31961491cf.24.1778669267294;
        Wed, 13 May 2026 03:47:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1a94:b0:50e:5a87:6c0c with SMTP id d75a77b69052e-5162fea2b7dmr31961331cf.24.1778669266911;
        Wed, 13 May 2026 03:47:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f18d50sm39593771fa.4.2026.05.13.03.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:47:45 -0700 (PDT)
Date: Wed, 13 May 2026 13:47:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] media: qcom: iris: vdec: update find_format to
 handle 8bit and 10bit formats
Message-ID: <zw4uy27x2twktstoryf6w7rldgkzymajtqhxpg4ri3rnwicpug@nwtnvbrsc2hb>
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-5-7fc049b93042@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-5-7fc049b93042@linaro.org>
X-Proofpoint-ORIG-GUID: IXzw3072nGKlJVKMC1mtNeFIGn3PYzHv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExMyBTYWx0ZWRfX/81LkfhBN/Yg
 7Ve26ffOA+CWOPJXptSuvFUz69Oeokt00XQVKlTzzrLnaTwT69qOJkOvzy4TH9AAoJDINoeQf25
 iXE+77WJKbqt+Q7xJS6bi2MUwbf1zTthYa3ZIzgdIdvy/5EihJtE0YL7DEcTS5n+Hh7/glHepzl
 tpWNqrwzWrTIObP5mMsMkJqcxGeN4WQvBBVeyBQf0zDeFx0ZEXUvSwkE2TVh7iYZXK5PxyAekLC
 A3Y2A3pIe+Mr4Yrbc0csnPPmXkPRZOp2bNmBpHAiLs5JJxrW//b8T5eWIetBQfAC39E2vDE82ow
 KESrJ55qk+ogPxXZzUi3QmJiz50M3i3VYFexSHc10+y8HpV/YB8+OyNjsy3uXpCuAfoBxVNjpK4
 /lLWpK2d4HoAHstrMot2yWb6+gnWXsELmxfkX4xrM0iu6NdPZAJb6gA47H/t4vBZ40TMYm0F1JI
 V/6UJEg7saLZkhBaozw==
X-Proofpoint-GUID: IXzw3072nGKlJVKMC1mtNeFIGn3PYzHv
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a0456d3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=BOoEFep4dHZxpVTRRokA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130113
X-Rspamd-Queue-Id: 574E05319C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107254-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 11:20:30AM +0200, Neil Armstrong wrote:
> The 10bit pixel format can be only used when the decoder identifies the
> stream as decoding into 10bit pixel format buffers, so update the
> find_format helper to filter the formats and only allow the proper
> formats when setting or trying a capture format.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_common.h |  1 +
>  drivers/media/platform/qcom/iris/iris_vdec.c            | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

