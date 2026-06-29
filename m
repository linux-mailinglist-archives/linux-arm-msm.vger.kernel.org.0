Return-Path: <linux-arm-msm+bounces-114960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ghbAH2NEQmrP3AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:09:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4586D8B6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:09:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lxd+YGM+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Z2lJB2DO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114960-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114960-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA7763021B1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D05E3F888A;
	Mon, 29 Jun 2026 10:02:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97333FBB47
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:02:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727359; cv=none; b=DTymC5R6/2eu5kbQYSoqGEhplOcm/YPcGMrk4Io6C1Moc2cORAhx0H4Co32K2i1igoaJcwuF1risdehSIFGqbPvyBsDNt8A04JeZgNOkhM84BbLNmroVbg8V5+XAncKHV94LDo5E7J+j6xbRhhcreor5rZCaxXL4Qc+ql3mtzNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727359; c=relaxed/simple;
	bh=wCpLSEqzl6yoBDde9p+VABZfQUJK0dP0DnJmF5kRzKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sf0u7yqoAKcgT0IXBLpcvRf8IUKPMMVGnAgoWzKTRur9QJ956XT6+P1XWBqdjLlrjKkVKsm+8GiIGVDIbOf3oNQ+87Wf/4QPPQ0AIn+A26yv6EejzCp6YHwHrBa/bDZaaG0NvgICGwEH/TveOuuEr/yBicVVjQWJnSAmRRMgqjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxd+YGM+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2lJB2DO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6r5xB2076419
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=; b=lxd+YGM+KoQxlNeH
	8pH+churOwNbEFL+qWr4HRWHCEr3Uop3Ij5kQnsEWZiTrq9LCMnfYAQFuAJXC0G1
	RvJm3Vvj0mwZVTYEMRq4OZm6aKl1pvMuMPt8/tI70W0Fav+WLUP6sCDOAMeTIkg7
	sYyokkHnxy90WWTH02di6CAtw73PBmkuY5DdzpQAYDz1Ho/8Cjw33prc7DWH2Ug9
	9iTA4r2rLsp5dPiCD0dcd1FegZy6kiCBK+ZT/QxbE9QPgeZgy6KYlu4Lwv38bFFL
	sOzWe7ftUFoAM2HFW7I8TYNAJblflt5TAX9D9nUoBCH1xNJbW3oTSsDo1NbKf21J
	lYtM2A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7gt9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:02:36 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-969275401c6so2993230241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727356; x=1783332156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=Z2lJB2DOLKHDIxNdezHnkSYwG6NFrVloe0DvKgngynoPIgZ5S4dKo4DVnnmdiDuEpg
         wIyB1NjsNEO4zvIME8RvYQnvugEFb8Ikf8t1ZQCfBQQyWuLhNymphgGd7X3R68wmtWfQ
         PNRzNVmNPUcgHzlShZF23626gTsUPfCC2ynpolEfWcu1VBb+QO9QKnsEIdyDoqh7wgAy
         txzE/AQggms70lGbV8fEbxoYPV56I0NT1vxftWhgTK/ac1lzBpp+Bw7jxcx9WN7IlA1q
         /XoXbs7Q4PpLgejBWE/d/tzuEEK1ZM2uGALJbN/0/0aRKsCHqYMo4Bf1kFAldg8lT6Vw
         k69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727356; x=1783332156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=Fsg8AJPxEPRvf//LHTBP/VCWXt1iUSJ1KL8sPaUrwy5QLUPgI9l+mjOmIp1ycg6RIa
         j0TuqkTChVKQP+qi0M5iSkImwz6jmydv03iSkBPH9NkR/KZpVGJvJzANTQ0w58XjBT05
         0FWWhuwpdP+PN4fDKzFDl+ZQAiRE2dIgao6Q9woqvN3+2nw8z+i60+lm8P5cOz3E0K8P
         nREYx7uuN3wOMnYI0lL4WEjEDSGX3XHfmVC85XC6JhpvxKQBDznT1L1eTSrGjLfUFzyK
         +ciNfl2DcPj1WyJHPYWj6b6TYQOcj1cVWSLfm7xr2By/h8eovUZ+tru5drRqOSd5gz5R
         4blg==
X-Forwarded-Encrypted: i=1; AHgh+RpS29T+vobp3yq0hcBtkf1xTqBi3JmrPEuZrEFgMV3hi3heEnE2PFaATKnSH+70Rg6sCiOCWQXsJm4KQN24@vger.kernel.org
X-Gm-Message-State: AOJu0YyseX+FcYLiWNLx+86B5aBPJSj8Jj8dHGeYkwWc0RPLBoZUrjyX
	iuQsMsxTQFUO4DVS5HQF8FVgG32G6xtuQbHY9sIPBrLZ6CbZaBSxoHlJUBdD2DImcE79YFl+okw
	OuOYE3/U3OHnEoYUH6xk2a74+8D4QQPD5Da1YjoMzUsO+mAGoHMxePsDnn5zi+T9Qa9Hs
X-Gm-Gg: AfdE7ckVxPHG0DKzpmDl7LVgmCcSgywGUAkv/bdPYUPmUXm2ZitFWB23p6q/dfCzHSn
	p/qLJ8envLf3VGno11C3ideML+SDdI79F0B//lhVIT5GLSMbxMduboPWEA4WoI5nAFSmlx6kIsn
	IDI45PwYcN6yk+kwevVhXu9XsyaN6/CQvVcpLQsfExH5c1nBf7QpHLFKA+ZbVxJvNVb/nV0fKAF
	vBoJZLJOIBFWsh2BxP/vUe5a02yn6WzkWl2dWFf22EI+Jb2pPCxh0o5JnFmh2QzSe/KhcVX4ZJD
	vcejMwddi8WDOeYfbAy1hnhJwi09p28TRwnDoqmiB42bN/8oIY6QHeM24NtYZ8MQB6h41kQ8Doz
	jKHwlSTxAJ4L2hUKC+Js1w2d2wq78JDI8GWKmxD1K
X-Received: by 2002:a05:6122:7d0:b0:5a5:3eea:4513 with SMTP id 71dfb90a1353d-5bd69dc3af5mr7025445e0c.12.1782727326000;
        Mon, 29 Jun 2026 03:02:06 -0700 (PDT)
X-Received: by 2002:a05:6122:7d0:b0:5a5:3eea:4513 with SMTP id 71dfb90a1353d-5bd69dc3af5mr7019570e0c.12.1782727294041;
        Mon, 29 Jun 2026 03:01:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:05 +0200
Subject: [PATCH v20 03/14] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-3-56f67da84c05@oss.qualcomm.com>
References: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wCpLSEqzl6yoBDde9p+VABZfQUJK0dP0DnJmF5kRzKI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJqJG4NZNDsu3JpoCMiZp9XSSPn3ihDbswpT
 eRQcXp5nSqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCagAKCRAFnS7L/zaE
 w0O7D/9JyrQzzkB6Wv5aFDilYPXHCfO21IAugUnx/jhdZge7cS0uKPqSl3fpxRpgvSXj+RRR5kg
 9H9jHZKnRdNXuz4SUrASw4kQ5c8ljBRgjMchfuTJ+LdIo25IcgjzLivdnrB1BpfNe43LwQtKL+x
 neMud/IXvYTf2wCDQ/C3AZRNjxVzSel7XqEw31QvO9+R7bqQ+fJ1CJA/MSBM4HRyaYk5BkALVuo
 MDh4fw99EflxoUkbyXJNgHKNfdch3FC9Wgt8qpy/JrjauwCgv/rxtne/IRWQ6eGx06YVSk5jvk7
 G7MDd26+G5V5DCznpnGLerUympvDBJaaKsqhb+szgyEfHcyN7KJ6Q5nJHkyPLnlG/jus12CAMLJ
 2V/bE7YPzzhNZQUO3U7u8F6Xo21Tw11UDlx5ZcSqYWgXO2KxAl9CUMff30s0O/dXCUOeffsScI7
 gk9hnmJAjWw2ROgbnw4WZO1Zi+1DfN+N0fOubDPkHsmR86sJelDk3yUxDS4lJaywRdRjOH9sh1u
 HF8ImB/FFfAZEucm2WvC8Wr1qaUs7PhhNfogsTbBCNvwi10Ty/z+vv9Y0yzR5MCmGx3e00fwDMx
 kQQj/Amm+hntJH42xAxr1RgzK0jaMHrM2SqvygNewU5I8u8+i70S1W1IltItgX9QhPe1SAbRzDl
 dvjlUNdtwr/vbuQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfXw2ZmJmZQuMbq
 oEIqtLgUKCEsXa7x3SEM6IdVQNnFg72R0MY6ouNDCMzsURd1d6DhWGJFZnD92MyGCe506rnXWdK
 Tm6VqtjPXEHvWcXH9XkjtmgJo+GZ630=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX8k+MajSe5dk5
 M+TY/H2iBxEt/0GshcvMO+Qp/+6zAtgUN410IcagFmJArDnFfaYRYNLYyTBr5qX6Fwh+5aRUmwQ
 0Zcj895xuIPvyZx5mu1jOuktWGQElTNBOlYSa7QOKEe6SG+ovs8huW9SvewGqdnBPyDUArbLk+A
 VCfgJ6EIyOP6zRDdNpZ6ImiMJviMGYZxMtJVSvkZcbhWwQd3DotmVcYleqBo9XK8qQGs+w/hjxV
 9DVfqBi1StfDBtmFXxxAer6n4ht1/SXCmn0sMP16gj/Xf4xUDKYWZL9KhZ7y6lqBaPpdgQW2Bvn
 wrdCWFp5ClgWQxH3tadW/TOjOZJHi95Zs4AJxPmbihVXYf29apnsp9NguHl0Y8/tAy1dEDtfKFt
 PbNVwnZ1RR+ks1LXLr8ZdZx5Bf4QglVhXFV4P1gBMF9ELl/06FEAKKtuVA8csSJZV6qbaXCSx44
 PNHQyRhK6AzTXZwAG6g==
X-Proofpoint-ORIG-GUID: PoaLZHhH2MpyDTlpNJjRInYi7d5-zTOz
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a4242bc cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PoaLZHhH2MpyDTlpNJjRInYi7d5-zTOz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[linaro.org:server fail,qualcomm.com:server fail,sea.lore.kernel.org:server fail,oss.qualcomm.com:server fail,vger.kernel.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114960-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:corbet@lwn.net,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:quic_utiwari@quicinc.com,m:mdalam@qti.qualcomm.com,m:lumag@kernel.org,m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:peter.ujfalusi@gmail.com,m:michal.simek@amd.com,m:Frank.Li@kernel.org,m:agross@codeaurora.org,m:neil.armstrong@linaro.org,m:dmaengine@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brgl@kernel.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:tharagopinath@gmail.com,m:peterujfalusi@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD4586D8B6E

BH workqueues are a modern mechanism, aiming to replace legacy tasklets.
Let's convert the BAM DMA driver to using the high-priority variant of
the BH workqueue.

[Vinod: suggested using the BG workqueue instead of the regular one
running in process context]

Suggested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index fc155e0d1870cbb7e099a2c4280f9f8fbdf6cf15..ea3df28e777f99c0532761b6aee6807ab23ab4ca 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -42,6 +42,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
 
 #include "../dmaengine.h"
 #include "../virt-dma.h"
@@ -426,8 +427,8 @@ struct bam_device {
 	struct clk *bamclk;
 	int irq;
 
-	/* dma start transaction tasklet */
-	struct tasklet_struct task;
+	/* dma start transaction workqueue */
+	struct work_struct work;
 };
 
 /**
@@ -892,7 +893,7 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 			/*
 			 * if complete, process cookie. Otherwise
 			 * push back to front of desc_issued so that
-			 * it gets restarted by the tasklet
+			 * it gets restarted by the work queue.
 			 */
 			if (!async_desc->num_desc) {
 				vchan_cookie_complete(&async_desc->vd);
@@ -922,9 +923,9 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
 
 	srcs |= process_channel_irqs(bdev);
 
-	/* kick off tasklet to start next dma transfer */
+	/* kick off the work queue to start next dma transfer */
 	if (srcs & P_IRQ)
-		tasklet_schedule(&bdev->task);
+		queue_work(system_bh_highpri_wq, &bdev->work);
 
 	ret = pm_runtime_get_sync(bdev->dev);
 	if (ret < 0)
@@ -1120,14 +1121,14 @@ static void bam_start_dma(struct bam_chan *bchan)
 }
 
 /**
- * dma_tasklet - DMA IRQ tasklet
- * @t: tasklet argument (bam controller structure)
+ * bam_dma_work() - DMA interrupt work queue callback
+ * @work: work queue struct embedded in the BAM controller device struct
  *
  * Sets up next DMA operation and then processes all completed transactions
  */
-static void dma_tasklet(struct tasklet_struct *t)
+static void bam_dma_work(struct work_struct *work)
 {
-	struct bam_device *bdev = from_tasklet(bdev, t, task);
+	struct bam_device *bdev = from_work(bdev, work, work);
 	struct bam_chan *bchan;
 	unsigned int i;
 
@@ -1140,14 +1141,13 @@ static void dma_tasklet(struct tasklet_struct *t)
 		if (!list_empty(&bchan->vc.desc_issued) && !IS_BUSY(bchan))
 			bam_start_dma(bchan);
 	}
-
 }
 
 /**
  * bam_issue_pending - starts pending transactions
  * @chan: dma channel
  *
- * Calls tasklet directly which in turn starts any pending transactions
+ * Calls work queue directly which in turn starts any pending transactions
  */
 static void bam_issue_pending(struct dma_chan *chan)
 {
@@ -1316,14 +1316,14 @@ static int bam_dma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_clk;
 
-	tasklet_setup(&bdev->task, dma_tasklet);
+	INIT_WORK(&bdev->work, bam_dma_work);
 
 	bdev->channels = devm_kcalloc(bdev->dev, bdev->num_channels,
 				sizeof(*bdev->channels), GFP_KERNEL);
 
 	if (!bdev->channels) {
 		ret = -ENOMEM;
-		goto err_tasklet_kill;
+		goto err_workqueue_cancel;
 	}
 
 	/* allocate and initialize channels */
@@ -1389,8 +1389,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
-err_tasklet_kill:
-	tasklet_kill(&bdev->task);
+err_workqueue_cancel:
+	cancel_work_sync(&bdev->work);
 err_disable_clk:
 	clk_disable_unprepare(bdev->bamclk);
 
@@ -1424,7 +1424,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 			    bdev->channels[i].fifo_phys);
 	}
 
-	tasklet_kill(&bdev->task);
+	cancel_work_sync(&bdev->work);
 
 	clk_disable_unprepare(bdev->bamclk);
 }

-- 
2.47.3


