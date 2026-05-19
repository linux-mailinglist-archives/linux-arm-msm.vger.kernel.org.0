Return-Path: <linux-arm-msm+bounces-108523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yP9/NV9lDGpXggUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:27:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AEF57FA16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52CCF311E0F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EF44F7988;
	Tue, 19 May 2026 13:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1bo/mAo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hSA0ajR+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B883ED3D7
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196711; cv=none; b=LEFW8R9yOqXbW48kXQhEtn7+635PnayeUATzjRSIgK5EOj0qKNZ+cljiepo9p2wmdswtpTqbnlReeyc2tmMBH9I+x/Ehsw6THXJ48W+VcqLvmz0yGA2RM9wZOTOmdQkZSi5V7B/h5Fr/m0ZXWS4oaKyihzFBGXiPKwBcgFlhyrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196711; c=relaxed/simple;
	bh=51qllpaj+ejQVsDQ4eqpW9Xup6eGEgdlD/8rDBDvfEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a296XqUDw97KHotEO1opOTRNu4wocHrHbxE9AA8kZZzUL0A556KHyv9Ty2Rwnj7F1Rtk7TAq8iN+/xWETVRo5eAswM52+9rCmUaxCTpx/2SjnItQZNjP1iRi94zYS0IVppf53ElgK1P+WL6MgfFT1rjtf5Dhtbvo+xQ1Bm4L/J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1bo/mAo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hSA0ajR+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JC3Dwq1737134
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q6yvC1N0mVZtsuZtG+L0tsQS32fNOMK+fMHNLzdHkLY=; b=Q1bo/mAo0V1OTNRZ
	wkhuCwIGnnofizJZJrpioab4iHSHE7Eh0n/q8lVgC8wcKvRNINzWiCDHDFkwQI01
	ltoICN1G4mozEHDwZqjAWBvVd0Z8j5u1lwWhM7dtP3IwlLGK6io9vTfeU9gXDXvi
	vqIRVD7R8I+u0HAiiZB1NJS3MdcB14o4nN4OCJY8V3AAaQypz4yLV/NgSeVEgGZY
	zWsqh83pT4utuA9R85hTe+snsOL74KLtWBNZeD7SOZIam04ZRlO8YI+o1E9aBZSt
	s33kvR2Cf23ih/QQhxHnvQ34F/k5GIKb5RYzqcIGAzL+esnLFAgrBCWHjQIJBM5M
	U7Td8Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ju91jm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:27 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-57536338b89so2316327e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196707; x=1779801507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q6yvC1N0mVZtsuZtG+L0tsQS32fNOMK+fMHNLzdHkLY=;
        b=hSA0ajR+2pG5qy3+7D1pU+Iwyc/UZJrc/MGZ7pVFfQ1v8nhwVhRuWGxPxnl5JprMX0
         dBz1W7fDdu5em5AcSmqb6QjbBMGiBStaYmCD1Inr0a8ynH2bYHlVlVGLvnwEKZXp8xMD
         Q8cjgcQSv8ZgyVddvL8YHSLnAIovvxMmxKo2zYvBtWQPl+q+swtABqWtjaMT0M8ZgRJO
         fFGtrkAzqTdGej8+fkML7M822kBrfKx3eWzJnPhTP2hETq5TCysOXYyGB7b3zNjEN8Cw
         Uzy+XagNXNo2VI6N5MDCn9EpdjL0Uqun+sqomDBB2W0HcGDFz/CN50kvUbfWEiyPpi9q
         dcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196707; x=1779801507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q6yvC1N0mVZtsuZtG+L0tsQS32fNOMK+fMHNLzdHkLY=;
        b=A+76VS4kpDh+KR3EbQGJPi5JhAQARFhaSMhd2Ttn+uZDnI9gxDDSBt3gSc1pvITDP+
         R3n0tBajq3xsvwtW+dJQNvF3FA9aj41oucDEuHOmZft1rXeyT8umGoaTnaQk/mbpj+0U
         b9LVsH2OOHFCYlxJfVO8wg+/V44dKuEAof/Hby5+9hpHvYkly+ScPEbcuORNsVvQA2Up
         rzfWmfA9KN6580ae6yLfvutpwtuEYnXVRvMC3ByKvEdWpS4YF/Juzn0aSi05dOV6NOPB
         lIwJ9UM2tjj+s9YavZWpO32XLAprSV4ViOmpDxqWf2J5jVMEBTpDdZtgqTmLoFK5bNHz
         oUSA==
X-Forwarded-Encrypted: i=1; AFNElJ+q/H7wDZFBxY1d12oIFvO7eStckUMoiM5cy0WSez2Px4n2FZ3RnzQdcZjbyATIav3qrL4+o0Nl4rBiYzlh@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh4l2QHcYdlXFt/lcNAlwYEjXhLr8xl0Up5P4tz4fV4JQuO94S
	1YWc2r8HEy/4FzgVZB4htmv5Dy4aeFH59ta7HubgLL/y8Hmfd8x109sZdGsQYuhelvBwNljhl5A
	I5C+eUI89k3xMOiaeDHmNfH7ipZ92zzIhdtDeffuBPzY4IvRoKJ1/hou+5GA9KZH0fevN
X-Gm-Gg: Acq92OG8D8MG+isw/prgAjt6AdCRA/gJ1zfee/0RXGA3jQHBs+/+fAMPr4SrKCDnrS/
	McwyEfOHOA/z6HDNaZdOgfSsRV1xc2dz1b1ULXbfu0MIqxM0SXKkkUX6SDkiwoa9kK63LxBzRxR
	7hYzspg857XoAqiFE53r9Ppv69FOMJpGAk2XaYh+gyNze3EecyWO7FPXoBdED6rCT4piY3iCguW
	qaU4d0LKiwV8IEvNSRHf7e+CGGAsX1jW2qGlW2QscF0Qg7TODTffzZsJw5LbfPwmx+fAyFDH5Jf
	8HDfKGgvSLx9z8YkUPxvI++ZgdKzytxgBtQElLhdD25FwafnYCQB2oOfPROBS8kB2qM1pBTilVI
	9eOv7Baz4uzM+y32eBHvKb/i9iykvVCbrN0lG2WMhSIBbYeTWaqg=
X-Received: by 2002:a05:6122:3412:b0:575:33d4:d100 with SMTP id 71dfb90a1353d-5760c08e3b6mr11168996e0c.13.1779196706867;
        Tue, 19 May 2026 06:18:26 -0700 (PDT)
X-Received: by 2002:a05:6122:3412:b0:575:33d4:d100 with SMTP id 71dfb90a1353d-5760c08e3b6mr11168957e0c.13.1779196706380;
        Tue, 19 May 2026 06:18:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:51 +0200
Subject: [PATCH v17 09/14] crypto: qce - Remove unused ignore_buf
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-9-53a595414b79@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=n0Cml8iSZ+MTejAlSL1Cpzw3FwIEirUqeMzFyFiqzq8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMKz8dbjF7OBkf/RWRj0NdmRujUn2PqTJYgP
 UoYP+NdutGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjCgAKCRAFnS7L/zaE
 wyWLEACxE9gJq++Y2ztjc929ID+NRJzmKorqaatD9rnOJ59HccANwaGyRcQPvF0ibV9BoUDDWQM
 ojjbGC7X0xb50YDrt7VSKGjH1uOXZqQF2s9Mr08oG8RqVUEJo3eSPqB6mfBzxPGcuSskyYcZO3k
 t34wBDR/zLrowQ0x4Qic9MUtQ9MnpQck25lFomtF/kQS4XN0hy/3LqRclILm2tIzXqaBdPB4BnG
 Od9Ziz1vUvLZ9a0bDX5Oc9fxIMatqPNaYwB7TR3GprjBpXFcUWFPtqh8i1ul+c2Zm0sEl1VhQUs
 tL0aDHZvdjknkrDvUuzluoFJ6t2RpYDS0RrQ4qWFSa3pRcY97AuXyxNQeTs5v3HYlW8/W+Bloi6
 zE+jlrOdpNROP8WHGCebpi5xceSwFCfxkkh2nCxbQncvNlvztleUAhA+jZyh4H665uPRyBFu2RZ
 HKwvY/ma7haHOPkQzwpIL7TBz9R6xTUkeCvyNQM7h6rYS1bp+GbMaovSf7+c5xwh1FrCpyGSZXJ
 9rCxX/OEt53EH2y+2ueEXB5FNpmQFTowQxqQ/9ocadalWpyrttveEPrn0pOKK9B2807bqZUevo+
 XfsF26GiHpGDm3OxL0+qpAu01hhLwgzz70FbzH/mOmmQxQd41hgDkrYeNOaIn+W/ciPT+U/d8Ry
 C5bRx2/yDatq8dg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: ZNcinCuPNhYisWLb03mpOMrMzqjUZKF0
X-Authority-Analysis: v=2.4 cv=eeUNubEH c=1 sm=1 tr=0 ts=6a0c6324 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX/wTWd6cp0cXG
 KzZqc/ieNqQZ7vHS3y36yHWHkoyixlvtmcMWLwuL/CsMlUqXqkPYwN4uBLmd68vrWIfq9JKZGs7
 bVO0FNxJOKaYOay6Q8PZnnYRz2iJFKFyqylNucEomOJQa+W3sh4rGFVEs/dyslMtTDcOC+SPSZs
 fK3efXKFUdjLEyZG7kM5JI+8qD0ugiTKFpm27PfJkY47EPsx3Mwm9Yw5ajazyvvUZ8R+k+7Su6o
 7jptQzQBWdCbWOEY+KMS9BPdbdTH1gPGEJs6J2TZncoe8Qzig3DHaF8ICyz52CDgBfNTe4vwVJw
 bnemy+vtkjK0cMXekbfkK95hmNhk7qQH3Np8/OmE7LeFI7Gk3K5Y2BHN52auHWqlz1hPRhBfBtx
 WDL8Jo8zMtuG8CMWUkw6bZxyAQ/W3TInngZu1kd5dTHOMGadjGS+ZhMEp1urucSpHf0fNhL343g
 2vxsWbQja5KGOWM9I4Q==
X-Proofpoint-ORIG-GUID: ZNcinCuPNhYisWLb03mpOMrMzqjUZKF0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108523-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 52AEF57FA16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 68cafd4741ad3d91906d39e817fc7873b028d498..08bf3e8ec12433c1a8ee17003f3487e41b7329e4 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -41,8 +43,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 		goto error_nomem;
 	}
 
-	dma->ignore_buf = dma->result_buf + QCE_RESULT_BUF_SZ;
-
 	return devm_add_action_or_reset(dev, qce_dma_release, dma);
 
 error_nomem:
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 31629185000e12242fa07c2cc08b95fcbd5d4b8c..fc337c435cd14917bdfb99febcf9119275afdeba 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -23,7 +23,6 @@ struct qce_result_dump {
 	u32 status2;
 };
 
-#define QCE_IGNORE_BUF_SZ	(2 * QCE_BAM_BURST_SIZE)
 #define QCE_RESULT_BUF_SZ	\
 		ALIGN(sizeof(struct qce_result_dump), QCE_BAM_BURST_SIZE)
 
@@ -31,7 +30,6 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
-	void *ignore_buf;
 };
 
 int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);

-- 
2.47.3


