Return-Path: <linux-arm-msm+bounces-108516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHV2AzJjDGpXggUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:18:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F80657F6F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51156303FBA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7BB4E379B;
	Tue, 19 May 2026 13:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDAipbQp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KITRA1jr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889ED4EA363
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196697; cv=none; b=mJTTfP9GHHilMNhkrSlx2CPB43vB8/ZsKH/WKYG1VhtQlFTUE2n0FJVpjefKXB446HdSVgfkT389D2tLRdEnDXy+9V5+TyzPZ8h/636JoYtX3G8ymvrlmXKJ546pNBC39Up27Bicvagf1AXBNgLrYBGGzNANq207v2A397uSRHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196697; c=relaxed/simple;
	bh=dAO3Z255k2yGXbKKHljWmfMX0+7AVaeyaum6kFL1QWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DuJaHcGwz3NutxPj5v4maqGA0n311/ZN5e6u/6Facn1IYhMwFxLPaUjP7fD/dXGb9rnq9vhFeCxk21CxiWlQ5cpk/LLRJbi4oxkMa2pCEddqVuzj24XOmGs/kyZrTWTGlbI5R7QJyTuOYK6Zh4O5yD3orn7AuTO7IXZNwCJlHFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDAipbQp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KITRA1jr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9LmuQ4062706
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	94MEU9aOFWh3av1FWToR/uMqLJdnwEcp9tKREkNbm2E=; b=lDAipbQpmkAng+Eu
	KkGXJ/8nrstxmlovaUnE02drCwjr11UJW4zWjPbS/ZeLkhh5YN1HqmxtU+MeeJ6Q
	NiU/SAOXBkc74TOzwmmQQXrN+jVJ9tnOvx8SXT9JxwNQeIYESJlISWfuYRlaR4TP
	Cl6j7gAuZW7IMVS3bT6lc7GujXKg8eaorbRXJ8JJU4zW1N4IIw6BXHrhfrP6bITh
	/KUfAdzh3gb0GNrhv89X4Bsfhm7OLLcLgSph4hCo0pzjrDpbMZUVxAvOCKSP9mh3
	3IyPODgPDkWX1eZzn2GXJC6FA4lBAjOJflVTPDdiCBk8exg6Lx8J4dzmq+4NHfHa
	Ay+2Ww==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8n5u0vjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:14 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-69d4c069cbbso465710eaf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196694; x=1779801494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94MEU9aOFWh3av1FWToR/uMqLJdnwEcp9tKREkNbm2E=;
        b=KITRA1jrjWb2dUr60oW8aY5nVDpRZlAKSeDCsQcNxbezFB2foDk86yhkwH58YuLgof
         dnS+AJWBNZ1OxHoxe99zn6x+yMxgHGAhXaf25896CswFN/dSFWg3NWpuuJBCh3spafng
         JKRzt2bqh/mQzVUnqdPj/SuIZcgvaPygZxYHo3Omr1Yi5XrJahlL/EkN097o9U2w13tR
         o7LxyYKIIzgwPj5oO+0pU9t4s1meN9WG+HxZfeq00psEFF1NYy8Ezg2pgDEjAHTZApyy
         MrodrBh1+WPMlKbab4zRh6uIOiLyOW2uRxdd1qLYNnq5o1wA9k+xwbSsTHFOXjRFjSms
         puDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196694; x=1779801494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=94MEU9aOFWh3av1FWToR/uMqLJdnwEcp9tKREkNbm2E=;
        b=ZWoz/elM7D03kmTpWPg9uCynuiYqQVtOHgDu+DSm0v/TDC86ygtHUnWY5dAcT9DTYP
         3GACk4wIGILQi4oll4w+xknWWK5d5TIhAmJdUR49GfP6e1zeBvBKbG4xhXv7A307AFzt
         VdbUn+ytmwC6b08z3YiegaNO9QcbcJT5HRvvphjMss2ThEBjJdt1gBG1sKy1hI5HTZ5R
         gB31IB3VMT2MT/r3eE3lk6xVeil+QKf1eaIpE7RXBKsO8CeY8iTkEIndPRzpA8SoA/7q
         sjwrvgCUNtHraN91oAjDa7+f5XoaryYjZ3XFFgXkT1tSzW8f1jGyLF2qUblG2wa1KoId
         jeEw==
X-Forwarded-Encrypted: i=1; AFNElJ8fJTfOJhBm7mHzIum4duDJnyMndRjTtUr/lb+EWxNnm1UXOKRtmA5HWQvcCilpaXSLyrkySpqFnj1mows/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/cMAGDiwoLXOkG+Q4hBZS5qRKDeKIGAJ/RNBPDRlTdrG93ebU
	PrqPoVIO/PaybkXJSKMveX6MEjISbzRcYKsAluu/6Vwd4dW5UiHaTUHA4D2wDIsG2Htyw8AQDX5
	5qNaDioT/e6HcLV+5ptnJfBfIwwpPpCgxwTwlnZ+sQARJ/hclIz3BWo+IZyFGB6qY+tzs
X-Gm-Gg: Acq92OHzarLWA7k9xN4Y0Nlz9+lKZfIBQH9PVMWf+sdVTH94zIMX2yZbycwSLV3u8ab
	GnPYOJBl7oIpHlgDtYWHueg3J6HANney/0aV0oB4qIe8jzedxAEZzx2LDY7wYblJGwzkD0OkLQk
	TNlxKlQtqJWUgYjAErj9q1uZBHTOXMuJD+7MUfD1UdMMeftAgw2xpdB625epbpcF0yb1c7FUcjq
	mXVZpL5pTaUmymbq7UHZy9JbRanZk9X46yA6iT4U5tA2AolnoAMDn/8FLzCwYjDAsGLq/4a+DtM
	k5vhlNiU+0EJRWX9wUQHONptlmh/IsRx0J10XmNnCoB0jlc3YxDLSYF4Ut/lOX+JOowGs9HNcwm
	r9XjWs7hOwIqHVUf6niXTMBmb0YaG3JLAdh82ebnmEmpnEcCE2Gc=
X-Received: by 2002:a4a:ec43:0:b0:69c:5d2b:4079 with SMTP id 006d021491bc7-69c942a5fcdmr10530460eaf.6.1779196693250;
        Tue, 19 May 2026 06:18:13 -0700 (PDT)
X-Received: by 2002:a4a:ec43:0:b0:69c:5d2b:4079 with SMTP id 006d021491bc7-69c942a5fcdmr10530424eaf.6.1779196692725;
        Tue, 19 May 2026 06:18:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:44 +0200
Subject: [PATCH v17 02/14] dmaengine: qcom: bam_dma: free interrupt before
 the clock in error path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-2-53a595414b79@oss.qualcomm.com>
References: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
In-Reply-To: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2456;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dAO3Z255k2yGXbKKHljWmfMX0+7AVaeyaum6kFL1QWE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMCgf4Vg3jkO6YzGQwECnhi4cg2IDvJ0MkJA
 qlIVBYqVvyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjAgAKCRAFnS7L/zaE
 wxwyEACRCzcpf1dcbSVhnrdOK6MTf2WN4sYADdEAPSBg7UExvO/UAPlKbl4qWSCdbqI7Sp30dam
 1lBBbBw7SujcVDWQOamidvxiW+AGaNdHUcEO95FhuU78gpd7ByKTUz9+xTJJBisemx1svtYeCiM
 /UamzNbkqavi9AYibWEmWiqLV6NBsyF4Wcj8QSFctG6xl4TXXIl3tU/YElUXqNDEAedNpITQxaq
 BLXyS2cNPubCFvc8IVp50+o1k1MQB49qODiHF7laucTjgmGc2h2PrGBJWY/Sac+ZdEIipgh3DpO
 Te/YSMpogxRkvH0RnfWBJTC21Zt0/8OytQh/sOit4gptvQPsk9dEw6sMp63zV5ugFRHO1HE1kBc
 spfWrUXezLFOhFYBDAQe/N/nva0FOAPCQSpSjXjd8iIogCHEvZTa2VeWsYd4ZTrMDjF71ubzULb
 QpZ21NnUvQdw8tuB1P/TMzsnSYAOmLlQakLkdfbZwgPtLzn390zJOHP1c0JQp1zrkLZCCpa1utL
 zm96A7yhlH/3WgAxb6tAPw0nnTnT63U3tCAuh3Oq6BCq1orm5VsxFbJq+wiI7Tt9ypKCngVCJyQ
 pS12KthdJkXwzGsHqLd5FaTC6o2PhErY/dqeq7lFpreydBX8FFGYQ32CWybUlG9PFI1hqOSwvxg
 K59ziLTDl0U8l5A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=MfBcfZ/f c=1 sm=1 tr=0 ts=6a0c6316 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=n8zAjjMAgf0wD31B80cA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: 7GE5Pu7bfiYscz5joYjrN6RfcsQ4VsgE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX2pslzYv0isBJ
 AtTSEsJ2JJJGPED35Aj3JSzHfSRvw3C0zMkGiJYurk9w6YhpgzYdvNX4tmc/AgLRxLX+FlKO9ei
 NjTut9xb1Q9dRH35WLvvcGdBRk7mJBly8zeIVgzaNalc/TdZe4nCsWQN1ypoOHcTAhFLmAUEdWL
 TXENtIlI4uvYCdbeAeaJw20b6vXkRsC7bNBtjxXouJ7j18rAUXZaZqO+lQxE+gGGf9rMP4qQBup
 yck83AU9CODUglHB0hF9S6FIQ8kp26KHLaITWbHFRe+MO6S9NATHUNrW/ajRLOD71tOFumgjL8L
 1MJpIdDx4EjKPgU7q2KiKJjzOxPCS9wmy6nMZb8h17mvChCHN7KU0GPWVU6PqozHDmZfI5Gala+
 kXPZD5lOJvfE8Cyjyp1vy7nSQdYy4s/sRhXpNTggNQhs8w8sHbRc6UUsOp+Em/DfFx9P1CPc0hs
 0tgC4IYXDoHz4sqMeiA==
X-Proofpoint-ORIG-GUID: 7GE5Pu7bfiYscz5joYjrN6RfcsQ4VsgE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108516-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sashiko.dev:url];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F80657F6F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The BAM interrupt is requested with a devres helper and so on error it's
freed after probe() returns. We disable the clock before freeing or
masking it so it may still fire and we may end up reading BAM registers
with clock disabled.

Stop using devres for interrupts as we free it in remove() manually
anyway. Add an appropriate label and free the interrupt before disabling
the clock in error path.

Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=2
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 19116295f8325767a0d97a7848077885b118241c..cea44833201d641ce6a657840d354abb443501b5 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1302,8 +1302,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	for (i = 0; i < bdev->num_channels; i++)
 		bam_channel_init(bdev, &bdev->channels[i], i);
 
-	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
-			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
+	ret = request_irq(bdev->irq, bam_dma_irq, IRQF_TRIGGER_HIGH, "bam_dma", bdev);
 	if (ret)
 		goto err_bam_channel_exit;
 
@@ -1336,7 +1335,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	ret = dma_async_device_register(&bdev->common);
 	if (ret) {
 		dev_err(bdev->dev, "failed to register dma async device\n");
-		goto err_bam_channel_exit;
+		goto err_free_irq;
 	}
 
 	ret = of_dma_controller_register(pdev->dev.of_node, bam_dma_xlate,
@@ -1355,6 +1354,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 
 err_unregister_dma:
 	dma_async_device_unregister(&bdev->common);
+err_free_irq:
+	free_irq(bdev->irq, bdev);
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
@@ -1379,7 +1380,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 	/* mask all interrupts for this execution environment */
 	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
-	devm_free_irq(bdev->dev, bdev->irq, bdev);
+	free_irq(bdev->irq, bdev);
 
 	for (i = 0; i < bdev->num_channels; i++) {
 		bam_dma_terminate_all(&bdev->channels[i].vc.chan);

-- 
2.47.3


