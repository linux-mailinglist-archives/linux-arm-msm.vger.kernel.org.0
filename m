Return-Path: <linux-arm-msm+bounces-118776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KkgsK/fiVGregQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:07:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA8C74B476
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:07:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=M65MNopO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jXLUbkBi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118776-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118776-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 084C4305B9BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A296414DF5;
	Mon, 13 Jul 2026 13:01:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86029414DD4
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:01:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947713; cv=none; b=MdcyPUD2AreNemEfeTiwbE2VpzTreo1FbxGibsNfSj3J/4jZwtt66dtWxF4NChBv/LubOJUMNWdWoHKRTOwhErjFVOXsKwDE4DjN/2JoQTpwRhvH8q55V9jXB/12pv8m5cfaFQMvvqsKQqN1EYjBXoTWe+MogdpUvlfTgzCSTL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947713; c=relaxed/simple;
	bh=NNnz6awfeEqmEC/yqDO0GWP7yizfp6R665Mk39/3FRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jWKB6Vtz3mJlC9mxf6axd2LALH8szNKZk6phcIZOeRMeQwC8MwDvMikwiFodnLAXac6a3BhqReixWHkUQVRktWZlUjgoTi51/zGz8a9t1NpNEm+do8iooIBiY52uDrreYxddPubtU4kEnnlI+OPE20U5ioeYU+YCMfYFKLYAC8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M65MNopO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jXLUbkBi; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDdYq1480701
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=; b=M65MNopOV93GUyBp
	bGUu7yuKBO4aN3cADTUPCgFE7bxMQ4PD637A24sb5Qe/ZAqVyoQ7q7SgkHvOmAxa
	YiRejNlh4hBbi+bfuetDusp+OwSyIZAwdtS+aHQvY8mlhEWTkNynHTvyAgESCw6Y
	fcvoH6B2WNuwTGy4RYabcK5/W6N8AFy+ySotFo4uirWiaQBQjs/gJue7PavgkPV4
	IlKhXjfBuPb5gukA38rgslHphDg08RuvjrQsrJngomgplXt2UwYa7lg8ih7DmRfo
	4Sdi/T+UrPlh7y/thZhX0KP33e/eh1j0IwO4OdEfdub9X2R1HUykgvqpyTMpukri
	U5k6+Q==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavrsq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:01:50 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a0c02365c7so5384060eaf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947710; x=1784552510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=;
        b=jXLUbkBiVJzqSyOoiZQM1xIzQMHn4pmxrygHtuFBqhRJ8VHUoIAELvYtLe8F7jAJEo
         QZJf3wYbzrCgqbWEta7hOx1PA/KfSomNDQE88cY9imb9d2SrePVtRXL/f8hDDgZcQP07
         WFq0zxMZGfPAxxmAKDer26eJL0l1fxNyoB/MYbTZOtOIX4Ocus2sPhvnaERRN+CGBnjX
         lbzjA6LTEp94gvU8iLUjsLCxkme2nuR2sRtInf5+xAcxFCCf6iyr26W+pLCqhnEmqr/W
         WtnuNX80af0hg/+kHZ1F7ATy6by6YLesxLpDaV3GlxjitjScpgaGDcBfTTiNLun/ZOZv
         Sekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947710; x=1784552510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=;
        b=iVzxxDw9ukMhYcFS3ESmJkhOkq/du4OPhSzpswiWUD2u65FdLVTx5Mx3nlWyAa6dCt
         Yf9EWN+9IxO8Rr4dl4w8TxG4n8MQ/iER7ZwOglXQHgOhaN/VQv+MmZaPzriJu4Q6HLX+
         obZ4aMiCsvk82ZY4VIyeVfDJzUKeTog+8hgnVsYSGQXc89Rz2Qn0iubXH58O1XeyFw+e
         iNjRdJzZUh/tLWvsvEg8v/DVhulNzbA76lUev5YzFZqygInALfw6guUObQcmAVDDKWx9
         KposGlwKP+8sWnE+qlvCe5wJeCJ+CzX3S1wvAbfyiJ5GmUPg1eiX67TGfR/Z2fEVQJY8
         KNQw==
X-Forwarded-Encrypted: i=1; AFNElJ8ge10LPAY1Q3UhSkq+b/mSvQ+Y84Vsw5+3yuYKywo8m+IKwHujEB+d3T8V54RCwTkSRZqXIX49xqPWgFaV@vger.kernel.org
X-Gm-Message-State: AOJu0YwaagwBF9hU2kRPuNtQ522+zhpCi+CYboX3zptYcJ7Tr0bvV4ZF
	wdSW2FhNGrFdmFMjKY5w0UgEBLpXnthmda+Dh80uyKkgJcS9PGDC3jnOTOSj1+IGcYtsv+L/3T2
	4RNW4DCXCun44Rj3xmeIJl9ZTaH7fGChf+dEMqDB188kgbtE93X9G2gqEVtFhcl3gQDoM
X-Gm-Gg: AfdE7ck7pHOuQa/xjfhxnr3bBdjQO+ycXLiGwlnQCQkGbWhr0ORTBSHBIWvd15LT9sQ
	v1bkreMHZ99J47+GcEB/ZLSVvdOaQN6D53yje466s+bjFPKAp24A8ILhNiH02OfRujzjmX6PenG
	PG0XDv917T51dEDYAV2ce/gBLwUAoFNpMf9h/6CKvgZyL4Gpmzg7q+MCcAXXhghbJZlLFYZa00F
	/v5cViERG/iFy0leyiQjzmHG2EI155G3rXfqlBbxWGNQmQgoiUlrEDr9xgG0LeJKCK4wo/XFjYG
	Tj8m5N2XK8RogD1r9xk9FbMEGotcy/QyTACedUEfxbJsWDCI3TBA0VhqGA85jhT8dS3Y0rPoMFR
	ztW82/gdBBN7wZDzkNGAQyD/FCCh9FOf81cwDtpG6
X-Received: by 2002:a05:6820:709a:20b0:6a3:7976:704f with SMTP id 006d021491bc7-6a39a5b9a15mr3798647eaf.26.1783947709806;
        Mon, 13 Jul 2026 06:01:49 -0700 (PDT)
X-Received: by 2002:a05:6820:709a:20b0:6a3:7976:704f with SMTP id 006d021491bc7-6a39a5b9a15mr3798556eaf.26.1783947708525;
        Mon, 13 Jul 2026 06:01:48 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:01:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:08 +0200
Subject: [PATCH v21 07/14] crypto: qce - Cancel work on device detach
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-7-bc2583e18475@oss.qualcomm.com>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2473;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NNnz6awfeEqmEC/yqDO0GWP7yizfp6R665Mk39/3FRo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGcH5zXrPcNI+T6P+/gycikSb+qYVbQi1DQU
 r+MiQXQlcqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThnAAKCRAFnS7L/zaE
 w0KCD/4yP5QoiE+i1I1Dzf1dFEqW7uoinT53GfY75/yhspqMCi7HzFWv3k/Fy/mD88OyK5AZGIS
 LRY6tDCfz1wOru9Bus5K67jEZgWlcWveAsPJrmsoaoRgJUP7sdCG1bkn5Bp7ODqCCHuW7zf14LW
 UmYMbCvmd5gySryeZUEocgI+sWvKLhBticmjTdanVKNNqsDh4jUxZn1NvcIkFMK171gLiVVEsIe
 QFsGfMP/AdcNcmSnlJy8bqbBXMTybZZ2+Mk5lZRmmYk1l4KBmHfyp6+s4McQCjip4ePxj8Itkh3
 r3XyPBOWSJAwOtNKStvuLxNheCdjccFNBlEwdZIfK2AmLlEWFcQkUO+ebCalLbT287JVhSezgqN
 hqIKxzTQ07014Vey1JqC2KzYWDfqdJ+5OAS1KoVlU0Y3ADY/x8U7yI6rJ9rebE2Sg78yV1GekIh
 Bz/lLUY2E1azgPj/PBQOtb15m8o3Cs8aP7JcXEiPJideSbc35+4o/MYKG46lkTzU6ypjPKnyye1
 Va6osQNaXPyKd2Royu6DliGPJWGT5Y3nBQWV76oM0IhRPKZBxFhAeuhi1cYJhHje92vDsgJPk6z
 52nF14H/e1UWFsqdgf/vnQfEOHSc/a4qMXqJC93+tcISNNptsbnhkf4Cp7YUPw+wZ40a4uuAYI5
 WCfSXCMXdhbo7FQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: QtjPFkQtGP54KGJRQgR4Q3iiwB7IBg2f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX4pQzc0Z9xbZV
 ES+da654RZbBOabw8Ce6KpH289XBT5Jjsx7eGKoLeG0r8UvGAEAzYDy4TG/jn+EVPX1sA65qvDM
 yHOGOWc/+aUefxRUK0i4lLRR4RXjdfAJ1Pg7dR20mI7YodEJxuxt8hm9ICgTJ6OgwNcJ9R5e0DT
 RifhQiygwYwdhJDo3FTvQfqVTBH95B8IuWeViWmHpatpNP96JxMcgW7R6b9SwUcHkOyCS/Y2ZHB
 aZBdtGaAfyiyZ2by7Hg16ToD+A1UUGwmNBZKSPQ88qZs19UxumRhlYI5pz+0N275vAsKcTRFjtU
 lqSuq0eMd5se0rkI/U7OD+wibqXPz1dd0wst1F9RF05es5qv/HLCFqgjA5gZCdvM9YdJT9Ynblw
 Im2fc7n8Xsu9qVhXtWGI11oFuAvZUnsIcdnvWCdNGeKkvJbvT5myfB4Aqzyo4Bf0VWnddh2mdOy
 pl7irqELVT1wViNxfgA==
X-Proofpoint-ORIG-GUID: QtjPFkQtGP54KGJRQgR4Q3iiwB7IBg2f
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a54e1be cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=SDQHpg0AWQOuS8LWovAA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX+IIXhEUvntuL
 RhL6DNPyWTZ/mLXrwBeaEWeTaqJeDK+zqUE603uR17HQ3yRgTDY2liwJVQPTA0o+Go2/CpuGfmh
 QjULwxyqS0kYE+uByKjGz6B/UIGk/Qs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118776-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:corbet@lwn.net,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:quic_utiwari@quicinc.com,m:mdalam@qti.qualcomm.com,m:lumag@kernel.org,m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:peter.ujfalusi@gmail.com,m:michal.simek@amd.com,m:Frank.Li@kernel.org,m:agross@codeaurora.org,m:neil.armstrong@linaro.org,m:dmaengine@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brgl@kernel.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:tharagopinath@gmail.com,m:peterujfalusi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sashiko.dev:url];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 3AA8C74B476

The workqueue is setup in probe() but never cancelled on error or in
remove(). Set up a devres action to clean it up. We need to move the
initialization earlier as we don't want to cancel the work before any
outstanding DMA transfer is terminated. Make sure we do terminate all
transfers in qce_dma_release() devres action.

Fixes: eb7986e5e14d ("crypto: qce - convert tasklet to workqueue")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=7
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 13 ++++++++++++-
 drivers/crypto/qce/dma.c  |  2 ++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index ac74f69914d6175b39ccde43f16269570fbcf715..b52a26ffff5ee733adcf4e8cf8bef75018dfa63e 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -185,6 +185,13 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
 }
 
+static void qce_cancel_work(void *data)
+{
+	struct work_struct *work = data;
+
+	cancel_work_sync(work);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -226,6 +233,11 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	INIT_WORK(&qce->done_work, qce_req_done_work);
+	ret = devm_add_action_or_reset(dev, qce_cancel_work, &qce->done_work);
+	if (ret)
+		return ret;
+
 	ret = devm_qce_dma_request(qce->dev, &qce->dma);
 	if (ret)
 		return ret;
@@ -238,7 +250,6 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	INIT_WORK(&qce->done_work, qce_req_done_work);
 	crypto_init_queue(&qce->queue, QCE_QUEUE_LENGTH);
 
 	qce->async_req_enqueue = qce_async_request_enqueue;
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 68cafd4741ad3d91906d39e817fc7873b028d498..7ec9d72fd690fb17e03ade7efe3cc522fb47e1ac 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -13,6 +13,8 @@ static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
 
+	dmaengine_terminate_sync(dma->txchan);
+	dmaengine_terminate_sync(dma->rxchan);
 	dma_release_channel(dma->txchan);
 	dma_release_channel(dma->rxchan);
 	kfree(dma->result_buf);

-- 
2.47.3


