Return-Path: <linux-arm-msm+bounces-114000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9bWuJlI2OWqIogcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:19:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF306AFC1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:19:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="G/PEP2X2";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NSqK6G6Y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114000-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114000-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1909C3011EB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781943B6BE6;
	Mon, 22 Jun 2026 13:18:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AC53B3BE5
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134327; cv=none; b=OPD8SSXp5QbPfX4ION+0sAHCmTsASiPkckz6z5kjO3eZkaraAFJKtsYxQca8yTc7E/VjypcAlM4/eyhSn3tWjATLpzRqoPxI1jziXhc4TOXZwcIFwOCofrUXg1SxlpIIRIwwmbN/j1x7OoJEapuFI+KX6ncyRr4wuocIw1DkNqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134327; c=relaxed/simple;
	bh=awXQ/brJfB9B4O7BSeRN3xqg4Q8yglcr7LBVBZ0rKKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k/b++Mv+lvxWLlTwofjB3E1bhSLp7mtlxRddSDhW+V0tisRDm5Wpx9Sk4s0sXtSmtJM+ZmQcypwdgUTyjm3S1lW7cqxVz6mnz0sPeRtmHB8FWPLEj8cWDFr/Nkcdj5e8643pDv7m/zLUqAtMAUzhbn83mVZjrcA8aGrSCLThGO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G/PEP2X2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NSqK6G6Y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDGAha1062317
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WSPAKkfSBcG7L+ITRQk41ncN8ei+Eb7mybQoEJRwyog=; b=G/PEP2X2wtbTbxYE
	B0NeEZX9Nul+sgy/YkwpzQzCBwY1BHaqTwqfpzUdVRLMy/886rrdrkGPdIzDUfXi
	sW+RuQS5WsJjWuNNrBCdwaJ4BeMLPBQxcvmL8WMhKd7c0wC6cDKaNLNq0QQxZfue
	N2jc+Cp2AuId+RACZRrvUJfyNVIwkEv4rH73IXiUxBkZGjhgkqiku+tQghLWG2km
	q8OkA7lG8bhD7gqPdoNXCs3KaoPUmKR+jh+sJvU8JLf02ri5KSnEN+OazPBqvZ7C
	Oj01Zsy7GpFuQSwppXKmM19Jmu3ppeLNxdyVeu5377/XzEu8gr9ZlQ1+jKIlbBCg
	4ZgVjA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4exyn1sn7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:44 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-48576b535b6so4892150b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782134324; x=1782739124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSPAKkfSBcG7L+ITRQk41ncN8ei+Eb7mybQoEJRwyog=;
        b=NSqK6G6YLrn0gMecRlU5cDQCuFdiTnfRYHXRo0YmDkXYHGNS+rf3NA8Wk+lCVIFcjb
         jMAy5xKxvBMCK4Plcbk7HN9rwEGgUS1PeBq2vQeREPa4r6P4dS8HimuiCstPSjlFB+A5
         wkfPLoyzhikfm9mkAFYuhL8KaRqsKq/szV+0HPUCjjCBQVxSULVf8BIzcTMwxyIQ2aRd
         UvSpthKv8bCSRpm28vtqNy+zjHb4CvRbS6rHLfVa5qs+LA3GUZ6y0YOWq/TV2hWJ6SSv
         6mO4VLy7rfVd9elBEMWzsjyMcAzd4IgNoFw2FGUDTnSnLWY9vu/ets/XWuoAw5/r93o0
         agrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782134324; x=1782739124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WSPAKkfSBcG7L+ITRQk41ncN8ei+Eb7mybQoEJRwyog=;
        b=GWjT+AAPwsZAOvubliDyMoWGAgkjwWmzW9A7UhJ/Dv3635C3HLCc+kf+zkDn7n2SUv
         YUosJgtyIvFL6SBl+gyv2RJPBJfghgo19gRTzdsmBErwfWCtTl/FfUIKkN1jvhAiQ1YV
         TIBajmThIH2QFznklzyRIBzo76lTrdPYLE5h3Tn1gLFvL8GdRNmWLpzF8d+eMYeXihWJ
         VL/hyilzBFHt1UC1YAOH/elsPaVEQqqc3FG1DkWOZGFE8smJGGpbwVJ2VPlZkH/utRmB
         WfHf0zIihQ5tFgv2AboVt8YSgNMrEcQ4bu2/t8FCzHcNA2LfWiHm+z9YFlZ00pzuY+0a
         +lzg==
X-Forwarded-Encrypted: i=1; AFNElJ+zKm4GrMT9CXmC6o4Afik+kQV/Jn7S2P4aFfCPvo0YWQm1UL+N2KGIIIOZKxjE/FSy0QJugjoGAo4gQ5+w@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9mYPOAZ8wJXcaISjpWinD5ghSDcP0NsNH6YR0zm2hjQ8i1raX
	m9K7tykkVHBLVs9/eEoHyOAyu69kswISREV6HRzfJ87a46+T7ZR+n216sFzyRotvaBkvwdX2wzP
	Sb20vy3RFFJTh0K6ljiouYeoJX32ymYrih4GcESqJGB8PGt5A9Y5LDvPyyR1HK7AYFsCs
X-Gm-Gg: AfdE7cl/TBsT2VqZ7SO4bHs8jqhN85npsOJl15lDPnTTmkXhYBtvjj8zt+iEa8QStz+
	dv4TwXhRH9n8Yf6IkaYvaf4b/q4dNpASwJoOFBmxnB3T5zX9zzCoOmMUa1oy4nkfbUv8Fu8yxQe
	/7W7b5zq5EZlsH5ctfIi8koPAKnRe2i/OTfdA2mxc2l9LI7wC3fMkIEljrNzBbmBTDsr4p563jp
	r3iwW6u2e2/IMgEm0kSE1SH6J/FNNyG2hzGS3eHLJOdrW99ZgzQ7HBGqNQht2uM30Qf3p0+OeVo
	t3ukdtmg5+J9/2l9GH71/nX6BkVebhlj7F3E3G49DlD0woT8I1mQ4BqUzyE+ko4XGrHfgLcPg15
	NrckP8A+yFe+BB/5myA18TiMlOOl1dYyGBMBLgPVZ
X-Received: by 2002:a05:6808:2389:b0:48a:a666:e55f with SMTP id 5614622812f47-48aa666e5f2mr9608877b6e.32.1782134323800;
        Mon, 22 Jun 2026 06:18:43 -0700 (PDT)
X-Received: by 2002:a05:6808:2389:b0:48a:a666:e55f with SMTP id 5614622812f47-48aa666e5f2mr9608849b6e.32.1782134323326;
        Mon, 22 Jun 2026 06:18:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dea2:c31b:2872:1bd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd30078sm294083835e9.7.2026.06.22.06.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:18:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:18:14 +0200
Subject: [PATCH v4 6/8] crypto: qce - Fix xts-aes-qce for weak keys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-qce-fix-self-tests-v4-6-4f82ffa716c6@oss.qualcomm.com>
References: <20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com>
In-Reply-To: <20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4133;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mUG51visYbQ+wh2a+16DhppioDJ/WPq+z6OvDSGkWVw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqOTYhnfnrNzT8Y13oWcPqQHrizQczcv4HVkIRB
 QsMiZ2kXmaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajk2IQAKCRAFnS7L/zaE
 w/VsD/sG1+oMUdZqcIlfPSuCsvNS8Pq4oH/221VefzXJtWwLHDRxsUVvhMcssnWLJtu/j2Fnswa
 oHh4zz+mQEJ48mto559/+08cMlWFBcwSAftVLXVCCzS64gBm30IeetigjMdmzPAzFgIg/XmmGyu
 +YB5bkGwpWAkhKZjQkEWlGLfciTGEeKXfm2GLnTNp0kms2o/2VkY6gWFLB8RsLnNFCe5/5GvMDN
 roUntYH6ye83QFJxKlcnpFkLgFjSGaGzdMEsGZoW5WEyjHr8btYfYO5gdjMWP5/LjzMYvQhE9/j
 SvSJYyRa2vh/MhVwF1lWiZSXsIIPyQcQzQ9dds35j7v34Q8N5hQ9RyP24pnBtoxiC60u7LySndX
 dxFKCtyER2CaeBI3RiMpPANYpcauCyzIwYMxRBiUQvwr1r1IMMgeAkEjUpvF64DeTF5EDqopmEm
 lNpRGqNkSxI0/KOcnQFQNSQF0UDHDj9QjAsvO1v1i6GHCypQArxfnoIt5yAdk5Q7b9bKuu1gkgN
 LZwZWVVVBl3zTjXVbdAMFr5pvnC7DsQm3U5E8+DingVyaHvFPT+jlFze+1LHjtXQRpN+O5up5Cs
 w5JOt0ejDAu38YGhdZeShKXzLxqTxSMarTymub8sW6epOcLrTVpK68+AuewJy+pjGGP5gLWcYrA
 29o/YuctKL4eLfA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 8iDcnp7jzHaY64a1bfvvQ3-jL_aIskaE
X-Authority-Analysis: v=2.4 cv=EOU2FVZC c=1 sm=1 tr=0 ts=6a393634 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=tpKvEUOkdOp8HkJiz7sA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzMSBTYWx0ZWRfX2951xUWXq7nn
 SZLKgfVSW4cH7xGErlvRdCE3KSqhtKRzTSsaFbGZjc+qndqkyS61dgDTDxqm8Ueix+akBmko6Ax
 SksYOXdhf/e6TGTe281hdUBomBC99D0=
X-Proofpoint-ORIG-GUID: 8iDcnp7jzHaY64a1bfvvQ3-jL_aIskaE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzMSBTYWx0ZWRfX8qYqfFSiJhSI
 C/Ij0IKu6Iv+1PJDQap6dNfX4U2fb/IUT3C+Lgmal4jknWr7zDFKCLu9C3eT/VfgpGfqbc4cF4B
 OOhZJqK8SZ0tuLHPjJL7aAKknW/ezFrp7L/CRRDxsnRuCPETYSqW++eIJR4eZsMsn+Drp5DXURy
 HUfG4z7/PPbj9fX7UOW1dD4cn7BYULwfgQC+tKiMaKBk+JgttLW3p5uRJ+Eu4N9V0c9AALsia8F
 xJOy4jfirU0dwBVFIDeZ2nX5AqEcI0M20qK20hp+2DSJ873deu5TPMnfSMRUITz3gVF2OINyKBP
 IiibnpWyYMorjwHOMI/2+PXmy7B5PC5kXYIn6fJ8QKalb+OdkfA8RI9CDdBhM9zZxBh7n/4vEMW
 p/GL6ZevvHuN0OqePokYvLiDr+yL7NGwZUOALNnCx400ClfeYIZc3EYv2SyYxZ7BSLNrzG08Tu4
 KLjZNHoRdV5QVw7OKOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114000-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BF306AFC1A

From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

The QCE hardware does not support AES XTS mode when key1 and key2 are
equal. The driver was handling this by unconditionally rejecting the
keys with -ENOKEY(-126), regardless of whether FIPS mode is active or
the FORBID_WEAK_KEYS flag is set.
[    5.599170] alg: skcipher: xts-aes-qce setkey failed on test vector 0; expected_error=0, actual_error=-126, flags=0x1
[    5.599184] alg: self-tests for xts(aes) using xts-aes-qce failed (rc=-126)

In general for weak keys,
- If FIPS mode is active or FORBID_WEAK_KEYS is set: return -EINVAL.
- In non-FIPS mode, Accept the key and encrypt successfully.

Since QCE was returning -ENOKEY for non-FIPS mode whereas the
expectation is to encrypt content and return success, the selftest saw a
mismatch and failed.

There are two problems in QCE behavior:
  * -ENOKEY is returned instead of -EINVAL for the FIPS/weak-key
    rejection case.
  * key1 == key2 is rejected even in non-FIPS mode

Fix xts-aes-qce behavior by using generic helper xts_verify_key() to
reject keys early with -EINVAL for FIPS mode active(or FORBID_WEAK_KEYS
set). For non-FIPS mode, since QCE hardware cannot accept the keys, use
software fallback mechanism to encrypt the data.

Cc: stable@vger.kernel.org
Fixes: f0d078dd6c49 ("crypto: qce - Return unsupported if key1 and key 2 are same for AES XTS algorithm")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/cipher.h   |  1 +
 drivers/crypto/qce/skcipher.c | 20 +++++++++++++-------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/qce/cipher.h b/drivers/crypto/qce/cipher.h
index 850f257d00f3aca0397adc1f703aea690c754d60..daea07551118d444d2f749588bdfe2ae2c6c553f 100644
--- a/drivers/crypto/qce/cipher.h
+++ b/drivers/crypto/qce/cipher.h
@@ -14,6 +14,7 @@
 struct qce_cipher_ctx {
 	u8 enc_key[QCE_MAX_KEY_SIZE];
 	unsigned int enc_keylen;
+	bool use_fallback;
 	struct crypto_skcipher *fallback;
 };
 
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 54ff013e24317cd4d7a0dcde88cef8268db784c9..6d5784760673074179eef47a1faadfab898a76f9 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -12,6 +12,7 @@
 #include <linux/errno.h>
 #include <crypto/aes.h>
 #include <crypto/internal/skcipher.h>
+#include <crypto/xts.h>
 
 #include "cipher.h"
 
@@ -194,14 +195,17 @@ static int qce_skcipher_setkey(struct crypto_skcipher *ablk, const u8 *key,
 	if (!key || !keylen)
 		return -EINVAL;
 
-	/*
-	 * AES XTS key1 = key2 not supported by crypto engine.
-	 * Revisit to request a fallback cipher in this case.
-	 */
 	if (IS_XTS(flags)) {
+		ret = xts_verify_key(ablk, key, keylen);
+		if (ret)
+			return ret;
 		__keylen = keylen >> 1;
-		if (!memcmp(key, key + __keylen, __keylen))
-			return -ENOKEY;
+		/*
+		 * QCE does not support key1 == key2 for XTS.
+		 * Use fallback cipher in this case.
+		 */
+		ctx->use_fallback = !crypto_memneq(key, key + __keylen,
+						       __keylen);
 	} else {
 		__keylen = keylen;
 	}
@@ -262,13 +266,15 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * needed in all versions of CE)
 	 * AES-CTR with a partial final block (the CE stalls waiting for a full
 	 * block of input).
+	 * AES-XTS with key1 == key2 (not supported by the CE).
 	 */
 	if (IS_AES(rctx->flags) &&
 	    ((keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_256) ||
 	    (IS_CTR(rctx->flags) && !IS_ALIGNED(req->cryptlen, AES_BLOCK_SIZE)) ||
 	    (IS_XTS(rctx->flags) && ((req->cryptlen <= aes_sw_max_len) ||
 	    (req->cryptlen > QCE_SECTOR_SIZE &&
-	    req->cryptlen % QCE_SECTOR_SIZE))))) {
+	    req->cryptlen % QCE_SECTOR_SIZE))) ||
+	    (IS_XTS(rctx->flags) && ctx->use_fallback))) {
 		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);
 		skcipher_request_set_callback(&rctx->fallback_req,
 					      req->base.flags,

-- 
2.47.3


