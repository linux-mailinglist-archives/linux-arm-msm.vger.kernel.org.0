Return-Path: <linux-arm-msm+bounces-32300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A78984751
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 16:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D34441C22771
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 14:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735A01A76CB;
	Tue, 24 Sep 2024 14:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="YfTvv7Ed"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038AF1474A4;
	Tue, 24 Sep 2024 14:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727186925; cv=none; b=UJkGYKL828372r+dZN3iPFagvEjzpgccWxh6M9g8czcEBVCgvisMMdA1gUNu76V3TAoJp3uimL6Ur8tKZFJQiZ+VoUdK78f9Ht0Q9noQgHIbeEAtYmWGROnZk9RsyGhNDN5oVs/owSKYQRuaMBwHkvCoko1wfCcw7XwMEAsA9J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727186925; c=relaxed/simple;
	bh=CFJ0SzValMWqmkQ2Qyk0Ijd/4Ig+SpndFjAHdOLUrj0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=RdsmDyCJZmwdV4SCORvVOj4eu6y4msnbxmfj4AuGXEWGD2vXPr56iZms7cd6oxEAvHHrb4xo6bs3rCeXgdnNZlBLuNkXpHjX6S+dB5DCmyBdnUpxw4MlvHRlQ6O6l4DPi8cvz5S4W+ImmwOAKt+M90SOnKFt6wk9EGiaVrBRN54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=YfTvv7Ed; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727186895; x=1727791695; i=markus.elfring@web.de;
	bh=ertJftNYJ3HOaugN5pCIYK1U3M/EPNN8Xkar1UEsejk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=YfTvv7EdhqaQjy/XDHlBVpJysb5xcPwMee5SreMIbyGjcIlJTzYrQfkdzz1tnEiq
	 yWMVAKvpq8JIWBR1+/Ox6CzAPBtlnm0MVrXJa20lAEm4izmSm5cNopTltD7/nH5c8
	 3yuPAwGEMJMANBGdCsVi08+FNZnH1hwWRSyhqcOo0/PH7pB9yfepPn+f0QROaaWX9
	 15Xr0kOgeYvx2ZKUiayxjx1bCRh1438zoPP2sxN3YRPh4T6WYJWeuTquq37+9RUDY
	 Dr8rbwUjdDO5zbjEEIFB+yTSxs8ZfTHumQHkhSvZEIL1cLn6X3tA0U12rFb/UHF7F
	 /pTfH3lExcAc2zlmug==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M7epr-1ssIKY2AjV-005Hzo; Tue, 24
 Sep 2024 16:08:15 +0200
Message-ID: <bea9842e-6910-4452-8f90-cb7482f3e76f@web.de>
Date: Tue, 24 Sep 2024 16:08:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Sibi Sankar <quic_sibis@quicinc.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] remoteproc: qcom: q6v5-mss: Use common error handling code in
 q6v5_mpss_load()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NzFPSA3JNvH5acVbbsdO8j8kFbvAFISMIz3lYU/hsuPGdlfTAzP
 24QB/nSYmME1WEFtUY9cAAr7OEJ9ZTEyIQevthLBcnTUT9t4EUwGYYAxqygH35CpaHfV8iH
 XGHNsXffExMUOezFTORX9Qumfnkkol1cVynlmCU/mQgy9rIV4rkueJLByp2L6BPwqFaaahu
 z6V/XW0Fvp2J5UkGNTtZA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eG2Ta63ZHP4=;p74Dz7v959Z40y5XuqY9JbOoZhz
 b1SQWOwbkGEZr6tz7913OGXs9pj5boUOWlisyAzsCKTFB8eLrpy6jL/g24WPp0ZIfAkugn99b
 zAsGvPPEpZYQme3I1l1n8w9QkRLafOgIoBfR9f7Z9T3rkiMbZqElsUsDOj4dm2/Z/vcKPn0hn
 Gkpu1WHhG+F3D3PPUgp1q3mwPk3DaO1P/44qlQJ32WajD9LQ6HRtPbjeYTc7W4od8ZvdskOMO
 1ppEkVyOJt79tBE+qIR20vln6j6T7r2Ui3WBg/ThD5W0WgdbNNPYrS1d8EIlsa13WnP3gj+xK
 U3wYUS3FXrnhcsjBztK4Fdntl8m7+UZb7sQiHrd6ToqioOmuXXJonsJzMFdDcFkI3JYTabboY
 /EQrOZDTARPKXXHvmQl9+cKcHpkGF5X8jc3Ohf3p4l3ujy1IGG9baiCmvF8AAfp9fsxyC6vag
 qAdsOO1PQJ4Rx2PZmNUsaqmVUFAdrY0A3t/ht28DHjXAMVv647PkAXi7kOL/hghz7rteZa0Cy
 xUDllSE4Fj6Ds4/pzOUYatzjvyYXWUZZQ9jocO7GI2FgOfjWd1iHP6woMUnUuBSPMkPiSx2+R
 m2n2ZhERptYb9a97J26OWS2bImAwc27pch1iy0kRE4q6lP+yu6qHjUawcnH7P4zGdQNmRnub8
 FYNba/20Te5dIvNTvw0OwcdDdw4iewHO3kx8JeTSOLWhnkMKbUX7Dm8HTHTuKS0bQvI5VoM7B
 HcdpaaQDPtzP7M01T4eDsOF+CRFR27YQkZ+F9jbwvpeeQG6CSIhNzuSS4mSy/6QFnyCpK++8R
 2XM6GjMkZlBR6DpqdkLhSvCQ==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Sep 2024 15:55:06 +0200

Add jump targets so that a bit of exception handling can be better reused
at the end of this function implementation.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/remoteproc/qcom_q6v5_mss.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_=
q6v5_mss.c
index 2a42215ce8e0..b398ae3083a1 100644
=2D-- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1451,9 +1451,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 				dev_err(qproc->dev,
 					"failed to load segment %d from truncated file %s\n",
 					i, fw_name);
-				ret =3D -EINVAL;
-				memunmap(ptr);
-				goto release_firmware;
+				goto e_inval_unmap;
 			}

 			memcpy(ptr, fw->data + phdr->p_offset, phdr->p_filesz);
@@ -1464,18 +1462,15 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 							ptr, phdr->p_filesz);
 			if (ret) {
 				dev_err(qproc->dev, "failed to load %s\n", fw_name);
-				memunmap(ptr);
-				goto release_firmware;
+				goto unmap_mem;
 			}

 			if (seg_fw->size !=3D phdr->p_filesz) {
 				dev_err(qproc->dev,
 					"failed to load segment %d from truncated file %s\n",
 					i, fw_name);
-				ret =3D -EINVAL;
 				release_firmware(seg_fw);
-				memunmap(ptr);
-				goto release_firmware;
+				goto e_inval_unmap;
 			}

 			release_firmware(seg_fw);
@@ -1528,6 +1523,12 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 	kfree(fw_name);

 	return ret < 0 ? ret : 0;
+
+e_inval_unmap:
+	ret =3D -EINVAL;
+unmap_mem:
+	memunmap(ptr);
+	goto release_firmware;
 }

 static void qcom_q6v5_dump_segment(struct rproc *rproc,
=2D-
2.46.1


